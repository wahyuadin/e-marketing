@extends('template.app')
@section('content')
    <div id="loading-overlay" class="d-none"
        style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255,255,255,0.8); z-index: 9999; display: flex; align-items: center; justify-content: center;">
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row mb-3">
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    <div class="col-md-8 col-12">
                        <h5 class="card-title">Data Self Schedule</h5>
                    </div>
                    <div class="col-md-4 col-12 text-md-end text-start mt-2 mt-md-0">
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class='bx bx-export'></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="javascript:void(0)" onclick="printPDF()">Print PDF</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0)" onclick="exportExcel()">Export Excel</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row gy-4">
                    <div class="col-md-6 col-12">
                        <div id="calendar"></div>
                    </div>
                    <div class="col-md-6 col-12">
                        <h5>List Event</h5>
                        <div class="table-responsive">
                            <table id="example" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tanggal</th>
                                        <th>Keterangan</th>
                                        <th>Dokter</th>
                                    </tr>
                                </thead>
                                <tbody id="eventList"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @include('superadmin.self-schedule.add')
@endsection

@push('style')
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
    <style>
        #calendar {
            max-width: 100%;
        }

        @media (max-width: 768px) {
            #calendar {
                font-size: 0.85rem;
            }

            .fc-toolbar-title {
                font-size: 1.2rem;
            }

            .fc-button {
                font-size: 0.8rem;
                padding: 0.25rem 0.5rem;
            }
        }
    </style>
@endpush

@push('scripts')
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>

    <script>
        function printPDF() {
            document.getElementById('loading-overlay').classList.remove('d-none');
            const {
                jsPDF
            } = window.jspdf;
            const doc = new jsPDF();
            const title = "DATA ABSENSI E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
            const pageWidth = doc.internal.pageSize.width;
            const titleWidth = doc.getTextWidth(title);
            doc.text(title, (pageWidth - titleWidth) / 2, 10);

            const headers = [];
            $('#example thead th').each(function() {
                headers.push($(this).text().trim());
            });

            const data = [];
            $('#example tbody tr').each(function() {
                const row = [];
                $(this).find('td').each(function() {
                    row.push($(this).text().trim());
                });
                data.push(row);
            });

            doc.autoTable({
                head: [headers],
                body: data,
                startY: 20,
                theme: "striped",
                styles: {
                    fontSize: 8,
                    textColor: [0, 0, 0]
                },
                headStyles: {
                    fillColor: [192, 192, 192],
                    textColor: [0, 0, 0]
                },
            });

            doc.save("Self_Schedule.pdf");
            document.getElementById('loading-overlay').classList.add('d-none');
        }

        function exportExcel() {
            document.getElementById('loading-overlay').classList.remove('d-none');

            const headers = [];
            $('#example thead th').each(function() {
                headers.push($(this).text().trim());
            });

            const data = [];
            $('#example tbody tr').each(function() {
                const row = [];
                $(this).find('td').each(function() {
                    row.push($(this).text().trim());
                });
                data.push(row);
            });

            const ws_data = [headers, ...data];
            const ws = XLSX.utils.aoa_to_sheet(ws_data);
            ws['!cols'] = headers.map((_, i) => ({
                wch: Math.max(...ws_data.map(r => (r[i] || '').length)) + 2
            }));

            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, "Self Schedule");
            XLSX.writeFile(wb, "Self_Schedule.xlsx");

            document.getElementById('loading-overlay').classList.add('d-none');
        }

        $(document).ready(function() {
            let tanggalTerpilih = '';

            const table = new DataTable('#example', {
                data: [],
                columns: [{
                        title: "Tanggal"
                    },
                    {
                        title: "Keterangan"
                    },
                    {
                        title: "Dokter"
                    },
                    {
                        title: "Outlet"
                    }
                ]
            });

            function loadEventList() {
                $.ajax({
                    url: `{{ route('self-schedule.getEvents', ['id' => Auth::user()->id]) }}`,
                    method: "GET",
                    success: function(events) {
                        const data = events.map(event => {
                            let [tanggal, waktu] = event.start.split(' ');
                            const keterangan = event.keterangan || '-';
                            const dokterInfo = `${event.dokter}`;
                            const outletInfo = `${event.instansi}`;
                            return [tanggal, keterangan, dokterInfo, outletInfo];
                        });

                        table.clear().rows.add(data).draw();
                    },
                    error: function(xhr) {
                        console.error("Gagal memuat event list:", xhr.responseText);
                    }
                });
            }

            const calendarEl = document.getElementById('calendar');
            const calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                selectable: true,
                editable: false,
                events: "{{ route('self-schedule.getEvents', ['id' => Auth::user()->id]) }}",

                dateClick: function(info) {
                    tanggalTerpilih = info.dateStr;
                    $('#tanggal').val(tanggalTerpilih);
                    $('#addData').modal('show');

                },

                eventClick: function(info) {
                    const event = info.event;
                    if (!event.id) return alert("Event ID tidak ditemukan");

                    if (confirm(`Hapus event "${event.title}"?`)) {
                        $.ajax({
                            url: `/self-schedule/${event.id}`,
                            type: 'POST',
                            data: {
                                _method: 'DELETE',
                                _token: '{{ csrf_token() }}'
                            },
                            success: function() {
                                event.remove();
                                loadEventList();
                                alert("Event berhasil dihapus.");
                            },
                            error: function(xhr) {
                                alert("Gagal menghapus event.");
                                console.error(xhr.responseText);
                            }
                        });
                    }
                }
            });

            calendar.render();
            loadEventList();

            $('.select2').select2({
                dropdownParent: $('#addData'),
                placeholder: "--- Pilih Dokter ---",
                theme: 'bootstrap-5'
            });

            $('#kategori').on('change', function() {
                let value = $(this).val();
                $('#dokterSelect, #outletSelect').hide();
                $('#kategoriWrapper').removeClass('col-md-6').addClass('col-md-12');

                // Reset nilai dan disable semua dulu
                $('#dokter').val(null).trigger('change').prop('disabled', true);
                $('#outlet').val(null).trigger('change').prop('disabled', true);

                if (value === 'dokter') {
                    $('#dokterSelect').show();
                    $('#dokter').prop('disabled', false);
                    $('#kategoriWrapper').removeClass('col-md-12').addClass('col-md-6');
                } else if (value === 'outlet') {
                    $('#outletSelect').show();
                    $('#outlet').prop('disabled', false);
                    $('#kategoriWrapper').removeClass('col-md-12').addClass('col-md-6');
                }
            });


            $('#addRow').click(function() {
                const tanggal = $('#tanggal').val();
                let dokterId = $('#dokter').val();
                let dokter = $('#dokter option:selected').text();
                let instansiId = $('#outlet').val();
                let instansi = $('#outlet option:selected').text();
                const keterangan = $('#keterangan').val();

                if (!tanggal) {
                    alert("Mohon pilih tanggal terlebih dahulu.");
                    return;
                }

                if (!dokterId && !instansiId) {
                    alert("Mohon pilih salah satu antara dokter atau outlet.");
                    return;
                } else if (!dokterId) {
                    dokter = '-';
                } else if (!instansiId) {
                    instansi = '-';
                }

                if (!keterangan) {
                    alert("Mohon isi keterangan.");
                    return;
                }

                const rowCount = $('#tableInput tbody tr').length + 1;
                const row = `
                <tr>
                    <td>${rowCount}</td>
                    <td><input type="hidden" name="tanggal[]" value="${tanggal}">${tanggal}</td>
                    <td><input type="hidden" name="dokter_id[]" value="${dokterId !== null ? dokterId : null }">${dokter}</td>
                    <td><input type="hidden" name="instansi_id[]" value="${instansiId !== null ? instansiId : null}">${instansi}</td>
                    <td><input type="hidden" name="keterangan[]" value="${keterangan}">${keterangan}</td>
                    <td><button type="button" class="btn btn-danger btn-sm btn-hapus-row">Hapus</button></td>
                </tr>
                `;
                $('#tableInput tbody').append(row);

                $('#dokter').val('').trigger('change');
                $('#instansi').val('').trigger('change');
                $('#submitBtn').prop('disabled', false);
            });

            $(document).on('click', '.btn-hapus-row', function() {
                $(this).closest('tr').remove();
                if ($('#tableInput tbody tr').length === 0) {
                    $('#submitBtn').prop('disabled', true);
                }
            });

            $('#addData').on('shown.bs.modal', function() {
                if (tanggalTerpilih) {
                    $('#tanggal').val(tanggalTerpilih);
                }
            });

            $('#addData').on('hidden.bs.modal', function() {
                $('#formEvent')[0].reset();
                $('#dokter').val('').trigger('change');
                $('#instansi').val('').trigger('change');
                $('#keterangan').val('');
                tanggalTerpilih = '';
            });
        });
    </script>
@endpush
