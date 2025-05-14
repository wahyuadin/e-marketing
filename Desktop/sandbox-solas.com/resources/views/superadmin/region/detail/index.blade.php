@extends('template.app')
@section('loading', 'active')
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
                        <h5 class="card-title">Detail Data Regional [{{ $title->region }}]</h5>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData">
                            <i class='bx bx-plus'></i>
                        </button>
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown">
                            <i class='bx bx-export'></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="javascript:void(0)" onclick="printPDF()">Print PDF</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0)" onclick="exportExcel()">Export Excel</a>
                            </li>
                        </ul>
                    </div>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="javascript:void(0)" onclick="printPDF()">Print PDF</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="javascript:void(0)" onclick="exportExcel()">Export
                                Excel</a>
                        </li>
                    </ul>
                    <div class="table-responsive">
                        @include('alert')
                        <table id="example" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th style="width : 5%">No</th>
                                    <th>Regional</th>
                                    <th>Area</th>
                                    <th>AM</th>
                                    <th>MR</th>
                                    <th style="width : 20%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($data as $datas)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $datas->region->region ?? '-' }}</td>
                                        <td>{{ $datas->wilayah->wilayah ?? '-' }}</td>
                                        <td>{{ $datas->wilayah->user->nama ?? '-' }}</td>
                                        <td>
                                            @if (isset($datas->wilayah) && $datas->wilayah->wilayahdetails->count() > 0)
                                                <ul>
                                                    @foreach ($datas->wilayah->wilayahdetails as $wilayahdetailsitem)
                                                        <li>{{ $wilayahdetailsitem->user->nama ?? '-' }}</li>
                                                    @endforeach
                                                </ul>
                                            @else
                                                Tidak Ada Data
                                            @endif
                                        </td>
                                        <td>
                                            <button data-bs-toggle="modal" data-bs-target="#ModalEdit"
                                                class="btn btn-warning btn-sm mb-2 mb-sm-0 bx bx-edit">
                                            </button>
                                            <a href="{{ route('regional-detail.destroy', $datas->id) }}"
                                                class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true">
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
    </div>
    @include('superadmin.region.detail.add')
    {{-- @include('admin.cabang.detail.edit') --}}
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
            new DataTable('#example');
        </script>
        <script>
            function ucwordsJS(str) {
                return str
                    .replace(/_/g, ' ') // ubah underscore ke spasi
                    .toLowerCase()
                    .replace(/\b\w/g, c => c.toUpperCase()); // huruf awal kapital
            }

            function printPDF() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                const {
                    jsPDF
                } = window.jspdf;
                let doc = new jsPDF();

                let title = "Data Regional Detail E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
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
                            let text = $('<div>').html($(this).html()).text().trim();
                            rowData.push(ucwordsJS(text));
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

                doc.save("Data_Regional_Detail.pdf");
                document.getElementById('loading-overlay').classList.add('d-none');
            }

            function exportExcel() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                let table = $('#example').DataTable();

                let headers = [];
                $('#example thead th').each(function(index) {
                    // Anda memiliki 6 kolom: No, Regional, Area, AM, MR, Action
                    // Anda ingin mengekspor 5 kolom pertama (indeks 0 sampai 4)
                    if (index < 5) { // Mengambil 5 kolom pertama (No, Regional, Area, AM, MR)
                        headers.push($(this).text().trim());
                    }
                });

                let data = [];
                table.rows({
                    search: 'applied' // Memastikan hanya data yang terfilter (jika ada filter) yang diekspor
                }).every(function() {
                    let rowNode = this.node(); // Dapatkan node TR
                    let cells = $('td', rowNode);
                    let rowData = [];

                    cells.each(function(cellIndex) {
                        // Hanya proses sel yang sesuai dengan jumlah header yang kita ambil
                        if (cellIndex < headers.length) {
                            let cellContent = '';
                            if (cellIndex === 4) { // Kolom MR (indeks ke-4) yang berisi <ul><li>
                                let listItems = [];
                                // Ambil teks dari setiap <li> di dalam sel ini
                                $(this).find('ul li').each(function() {
                                    listItems.push($(this).text().trim());
                                });
                                // Gabungkan item list dengan karakter baris baru (\n)
                                cellContent = listItems.join("\n");
                            } else {
                                // Untuk kolom lain, ambil teks seperti biasa
                                // Menggunakan .html() lalu .text() untuk menghapus tag HTML lain jika ada, lalu trim
                                cellContent = $('<div>').html($(this).html()).text().trim();
                            }
                            // Fungsi ucwordsJS Anda jika masih diperlukan (opsional, tergantung preferensi)
                            // Jika ingin data asli tanpa modifikasi case:
                            // rowData.push(cellContent);
                            // Jika ingin dengan ucwordsJS:
                            rowData.push(ucwordsJS(cellContent));
                        }
                    });
                    // Pastikan hanya menambahkan rowData jika memiliki jumlah kolom yang sama dengan header
                    // Ini untuk menghindari error jika ada kolom "Action" yang tidak sengaja terproses sebagian
                    if (rowData.length === headers.length) {
                        data.push(rowData);
                    }
                });

                let ws_data = [headers, ...data];
                let ws = XLSX.utils.aoa_to_sheet(ws_data);

                // Mengatur Lebar Kolom Otomatis
                const colWidths = headers.map((_, colIndex) => {
                    let maxWidth = 0;
                    ws_data.forEach(row => {
                        const cellValue = row[colIndex];
                        if (cellValue) {
                            // Jika sel berisi \n, kita perlu mencari baris terpanjang di dalam sel tersebut
                            const lines = String(cellValue).split('\n');
                            lines.forEach(line => {
                                if (line.length > maxWidth) {
                                    maxWidth = line.length;
                                }
                            });
                        }
                    });
                    // Beri sedikit padding, minimal lebar 10
                    return {
                        wch: Math.max(10, maxWidth + 2)
                    };
                });
                ws['!cols'] = colWidths;

                // Mengaktifkan Wrap Text untuk sel yang mengandung baris baru
                // Ini akan membantu Excel menyesuaikan tinggi baris secara otomatis
                for (let R = 0; R < ws_data.length; ++R) {
                    for (let C = 0; C < headers.length; ++C) {
                        const cell_address = XLSX.utils.encode_cell({
                            r: R,
                            c: C
                        });
                        if (ws[cell_address] && ws[cell_address].v && typeof ws[cell_address].v === 'string' && ws[cell_address]
                            .v.includes('\n')) {
                            if (!ws[cell_address].s) ws[cell_address].s = {}; // Pastikan objek style ada
                            ws[cell_address].s.alignment = {
                                ...(ws[cell_address].s.alignment || {}),
                                wrapText: true
                            };
                        }
                    }
                }

                let wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, "Data Regional Detail"); // Nama sheet diperbaiki

                XLSX.writeFile(wb, "Data_Regional_detail.xlsx");
                document.getElementById('loading-overlay').classList.add('d-none');
            }
        </script>
    @endpush
@endsection
