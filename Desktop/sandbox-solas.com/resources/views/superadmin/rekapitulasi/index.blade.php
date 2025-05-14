@extends('template.app')

@section('content')
    <!-- Overlay loading -->
    <div id="loading-overlay" class="d-none"
        style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255,255,255,0.8); z-index: 9999; display: flex; align-items: center; justify-content: center;">
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <!-- Start of Selection -->
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Rekapitulasi Master</h5>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4 d-flex align-items-center">
                        @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                            <button type="button" class="btn btn-outline-primary me-2" data-bs-toggle="modal"
                                data-bs-target="#importData">
                                <i class='bx bx-import me-1'></i> Import
                            </button>
                        @endif
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-info dropdown-toggle" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <i class='bx bx-export me-1'></i> Export
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="javascript:void(0)" onclick="printPDF()">
                                        <i class='bx bxs-file-pdf me-2'></i>Cetak PDF
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="javascript:void(0)" onclick="exportExcel()">
                                        <i class='bx bx-spreadsheet me-2'></i>Ekspor Excel
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        @include('alert')
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>NSM</th>
                                <th>Regional</th>
                                <th>RSM</th>
                                <th>Cabang</th>
                                <th>Kode Cabang</th>
                                <th>AM</th>
                                <th>MR</th>
                                <th>Kode MR</th>
                                <th>Area</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $nsm = \App\Models\User::where('role', 'nsm')->value('nama');
                            @endphp
                            @php $no = 1; @endphp
                            @foreach ($data as $item)
                                @php
                                    $nsm = $nsm ?? 'Data Belum Di Inputkan';
                                    $regional = $item->region ?? 'Data Belum Di Inputkan';
                                    $rsm = $item->user->nama ?? 'Data Belum Di Inputkan';

                                    $rows = collect();
                                    foreach ($item->regiondetails as $detail) {
                                        $wilayah = $detail->wilayah;

                                        $kodeCabang = $wilayah->code ?? 'Data Belum Di Inputkan';
                                        $namaCabang = $wilayah->wilayah ?? 'Data Belum Di Inputkan';
                                        $am = $wilayah->user->nama ?? 'Data Belum Di Inputkan';

                                        foreach ($wilayah->wilayahdetails ?? [] as $wd) {
                                            $area = $wd->area->area ?? 'Data Belum Di Inputkan';
                                            $mr = $wd->user->nama ?? 'Data Belum Di Inputkan';
                                            $kodeMr = $wd->kode_mr ?? 'Data Belum Di Inputkan';

                                            $rows->push([
                                                'kode_cabang' => $kodeCabang,
                                                'nama_cabang' => $namaCabang,
                                                'am' => $am,
                                                'mr' => $mr,
                                                'kode_mr' => $kodeMr,
                                                'area' => $area,
                                            ]);
                                        }
                                    }

                                    $rows = $rows->unique();
                                @endphp

                                @foreach ($rows as $row)
                                    <tr>
                                        <td>{{ $no++ }}</td>
                                        <td>{{ $nsm }}</td>
                                        <td>{{ $regional }}</td>
                                        <td>{{ $rsm }}</td>
                                        <td>{{ $row['nama_cabang'] }}</td>
                                        <td>{{ $row['kode_cabang'] }}</td>
                                        <td>{{ $row['am'] }}</td>
                                        <td>{{ $row['mr'] }}</td>
                                        <td>{{ $row['kode_mr'] }}</td>
                                        <td>{{ $row['area'] }}</td>
                                    </tr>
                                @endforeach
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @include('superadmin.rekapitulasi.import')
    @push('style')
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
    @endpush

    @push('scripts')
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>

        <script>
            new DataTable('#example', {
                lengthMenu: [
                    [10, 25, 50, -1], // Nilai
                    [10, 25, 50, 'All'] // Label
                ],
            });


            function date() {
                const today = new Date();
                const date = today.getDate() + "_" + (today.getMonth() + 1) + "_" + today.getFullYear();
                return date;
            }

            function ucwordsJS(str) {
                return str.replace(/_/g, ' ').toLowerCase().replace(/\b\w/g, c => c.toUpperCase());
            }

            function getCellText(html) {
                const tempDiv = document.createElement('div');
                tempDiv.innerHTML = html;

                const wilayahList = tempDiv.querySelector('.all-wilayah-list');
                if (wilayahList) {
                    return Array.from(wilayahList.querySelectorAll('div')).map(div => div.textContent.trim()).join('\n');
                }

                const listItems = tempDiv.querySelectorAll('li');
                if (listItems.length) {
                    return Array.from(listItems).map(li => li.textContent.trim()).join('\n');
                }

                return tempDiv.textContent.trim();
            }

            function printPDF() {
                document.getElementById('loading-overlay').classList.remove('d-none');
                const {
                    jsPDF
                } = window.jspdf;

                // Ubah orientasi menjadi 'landscape'
                const doc = new jsPDF('landscape');

                const title = "Rekapitulasi Master Data E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
                const pageWidth = doc.internal.pageSize.width;
                const titleWidth = doc.getTextWidth(title);
                doc.text(title, (pageWidth - titleWidth) / 2, 10);

                const table = $('#example').DataTable();
                const headers = [];

                $('#example thead th').each(function(index) {
                    headers.push($(this).text().trim());
                });

                const data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    const row = this.node();
                    const cells = $('td', row);
                    const rowData = [];

                    cells.each(function(index) {
                        let html = $(this).html();
                        let text = getCellText(html);

                        // Ubah Regional menjadi kapital
                        if (index === 2) {
                            text = text.toUpperCase();
                        }
                        // Jangan ubah Kode Cabang dan Kode MR
                        if (index === 5 || index === 8) {
                            text = text; // Tetap apa adanya
                        } else {
                            text = ucwordsJS(text); // Tetap menggunakan ucwords untuk kolom lain
                        }

                        rowData.push(text);
                    });

                    data.push(rowData);
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
                    columnStyles: {
                        0: {
                            cellWidth: 15
                        }, // Example custom width for first column
                        // You can add similar adjustments for other columns here
                    }
                });

                doc.save("Rekapitulasi_Master" + date() + ".pdf");
                document.getElementById('loading-overlay').classList.add('d-none');
            }

            function exportExcel() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                const table = $('#example').DataTable();
                const headers = [];

                $('#example thead th').each(function(index) {
                    headers.push($(this).text().trim());
                });

                const data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    const row = this.node();
                    const cells = $('td', row);
                    const rowData = [];

                    cells.each(function(index) {
                        let html = $(this).html();
                        let text = getCellText(html);

                        // Ubah Regional menjadi kapital
                        if (index === 2) {
                            text = text.toUpperCase();
                        }
                        // Jangan ubah Kode Cabang dan Kode MR
                        if (index === 5 || index === 8) {
                            text = text; // Tetap apa adanya
                        } else {
                            text = ucwordsJS(text); // Tetap menggunakan ucwords untuk kolom lain
                        }

                        rowData.push(text);
                    });

                    data.push(rowData);
                });

                const ws_data = [headers, ...data];
                const ws = XLSX.utils.aoa_to_sheet(ws_data);

                ws['!cols'] = ws_data[0].map((_, colIndex) => {
                    let maxWidth = 10;
                    ws_data.forEach(row => {
                        const cell = row[colIndex];
                        if (cell && cell.length > maxWidth) maxWidth = cell.length;
                    });
                    return {
                        wch: maxWidth + 2
                    };
                });

                const wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, "Rekapitulasi Master");
                XLSX.writeFile(wb, "Rekapitulasi_Master_" + date() + ".xlsx");
                document.getElementById('loading-overlay').classList.add('d-none');
            }
        </script>
    @endpush
@endsection
