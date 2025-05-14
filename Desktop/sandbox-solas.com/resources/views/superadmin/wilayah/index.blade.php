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
                        <h5 class="card-title">Data Cabang</h5>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData">
                            <i class='bx bx-plus'></i>
                        </button>
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class='bx bx-export'></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item" href="javascript:void(0)" onclick="printPDF()">Print PDF</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="javascript:void(0)" onclick="exportExcel()">Export
                                    Excel</a>
                            </li>
                        </ul>
                    </div>
                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        @include('alert')
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Cabang</th>
                                <th>Code Cabang</th>
                                <th>AM</th>
                                <th>MR</th>
                                <th>Dokter</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $datas->wilayah ?? '-' }}</td>
                                    <td>{{ $datas->code ?? '-' }}</td>
                                    <td>{{ $datas->user->nama ?? '-' }}</td>
                                    <td>
                                        @if ($datas->wilayahdetails->count() > 0)
                                            <ul>
                                                @foreach ($datas->wilayahdetails->take(2) as $wilayahdetailsitem)
                                                    <li>{{ $wilayahdetailsitem->user->nama ?? '-' }}</li>
                                                @endforeach
                                                {{-- Hidden semua nama MR --}}
                                                @if ($datas->wilayahdetails->count() > 3)
                                                    <li>...</li>
                                                @endif
                                                <div class="all-mr-list d-none">
                                                    @foreach ($datas->wilayahdetails as $mr)
                                                        <div>{{ $mr->user->nama ?? '-' }}</div>
                                                    @endforeach
                                                </div>
                                            </ul>
                                        @else
                                            Tidak Ada Data
                                        @endif

                                    </td>
                                    <td>
                                        @if ($datas->dokter->count() > 0)
                                            <ul>
                                                @foreach ($datas->dokter->take(2) as $dokteritem)
                                                    <li>{{ $dokteritem->dokter ?? '-' }}</li>
                                                @endforeach
                                                @if ($datas->dokter->count() > 3)
                                                    <li>...</li>
                                                @endif
                                            </ul>
                                            {{-- Tambahkan hidden input berisi semua nama dokter --}}
                                            <div class="all-dokter-list d-none">
                                                @foreach ($datas->dokter as $dokteritem)
                                                    <div>{{ $dokteritem->dokter ?? '-' }}</div>
                                                @endforeach
                                            </div>
                                        @else
                                            Tidak Ada Data
                                        @endif
                                    </td>
                                    <td class="d-flex flex-column flex-sm-row gap-2">
                                        @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                                            <button data-bs-toggle="modal" data-bs-target="#ModalEdit{{ $datas->id }}"
                                                class="btn btn-warning btn-sm mb-2 mb-sm-0 bx bx-edit">
                                            </button>
                                            <a href="{{ route('wilayah.destroy', $datas->id) }}"
                                                class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true">
                                            </a>
                                        @endif
                                        <a href="{{ route('wilayah-detail.show', $datas->id) }}"
                                            class="btn btn-info btn-sm mb-2 mb-sm-0 bx bx-detail">
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @include('superadmin.wilayah.add')
    @include('superadmin.wilayah.edit')
    @push('style')
        {{-- datatable --}}
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
    @endpush

    @push('scripts')
        {{-- DataTables JS --}}
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>

        {{-- Library untuk Export Excel --}}
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
        </script>
        <script>
            function ucwordsJS(str) {
                return str
                    .replace(/_/g, ' ') // ubah underscore ke spasi
                    .toLowerCase()
                    .replace(/\b\w/g, c => c.toUpperCase()); // huruf awal kapital
            }

            function getCellText(html) {
                let tempDiv = document.createElement('div');
                tempDiv.innerHTML = html;

                let allMrDiv = tempDiv.querySelector('.all-mr-list');
                let allDokterDiv = tempDiv.querySelector('.all-dokter-list');
                let text = '';

                if (allMrDiv) {
                    let mrNames = Array.from(allMrDiv.querySelectorAll('div'));
                    text = mrNames.map(div => div.textContent.trim()).join('\n');
                } else if (allDokterDiv) {
                    let dokterNames = Array.from(allDokterDiv.querySelectorAll('div'));
                    text = dokterNames.map(div => div.textContent.trim()).join('\n');
                } else {
                    let listItems = tempDiv.querySelectorAll('li');
                    if (listItems.length > 0) {
                        text = Array.from(listItems).map(li => li.textContent.trim()).join('\n');
                    } else {
                        text = tempDiv.textContent.trim();
                    }
                }

                return ucwordsJS(text);
            }

            function printPDF() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                const {
                    jsPDF
                } = window.jspdf;
                let doc = new jsPDF();

                let title = "DATA Cabang E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
                let pageWidth = doc.internal.pageSize.width;
                let titleWidth = doc.getTextWidth(title);
                doc.text(title, (pageWidth - titleWidth) / 2, 10);

                let table = $('#example').DataTable();

                // Ambil header (tanpa kolom terakhir: misal Action)
                let headers = [];
                $('#example thead th').each(function(index) {
                    if (index < 6) { // hanya sampai "Foto", kolom ke-6 (index 0-5)
                        headers.push($(this).text().trim());
                    }
                });

                let data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    let row = this.node();
                    let cells = $('td', row);
                    let rowData = [];

                    cells.each(function(index) {
                        if (index < headers.length) {
                            let html = $(this).html();
                            rowData.push(getCellText(html));
                        }
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
                });

                doc.save("Data_Cabang.pdf");
                document.getElementById('loading-overlay').classList.add('d-none');
            }

            function exportExcel() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                let table = $('#example').DataTable();

                let headers = [];
                $('#example thead th').each(function(index) {
                    if (index < 6) { // sampai "Foto"
                        headers.push($(this).text().trim());
                    }
                });

                let data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    let row = this.node();
                    let cells = $('td', row);
                    let rowData = [];

                    cells.each(function(index) {
                        if (index < headers.length) {
                            let html = $(this).html();
                            rowData.push(getCellText(html));
                        }
                    });


                    data.push(rowData);
                });

                let ws_data = [headers, ...data];
                let ws = XLSX.utils.aoa_to_sheet(ws_data);
                Object.keys(ws).forEach(cell => {
                    if (cell[0] === '!') return;
                    if (!ws[cell].s) ws[cell].s = {};
                    ws[cell].s.alignment = {
                        wrapText: true,
                        vertical: "top"
                    };
                });


                // Set lebar kolom otomatis (seperti sebelumnya)
                let colWidths = ws_data[0].map((_, colIndex) => {
                    let maxWidth = 10;
                    ws_data.forEach(row => {
                        let cell = row[colIndex];
                        if (cell && cell.length > maxWidth) {
                            maxWidth = cell.length;
                        }
                    });
                    return {
                        wch: maxWidth + 2
                    };
                });
                ws['!cols'] = colWidths;

                // Estimasi tinggi baris berdasar jumlah baris dalam sel (jumlah \n)
                let rowHeights = ws_data.map(row => {
                    let maxLines = Math.max(...row.map(cell => (cell.match(/\n/g) || []).length + 1));
                    return {
                        hpt: maxLines * 15
                    }; // sekitar 15pt per baris
                });
                ws['!rows'] = rowHeights;


                let wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, "Data Cabang");

                XLSX.writeFile(wb, "Data_Cabang.xlsx");
                document.getElementById('loading-overlay').classList.add('d-none');
            }
        </script>
    @endpush
@endsection
