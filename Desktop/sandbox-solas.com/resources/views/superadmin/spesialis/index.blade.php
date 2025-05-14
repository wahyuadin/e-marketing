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
                        <h5 class="card-title">Data Spesialis</h5>
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
                                <th>Spesialis</th>
                                @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $datas->spesialis }}</td>
                                    @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                                        <td class="d-flex flex-column flex-sm-row">
                                            <button data-bs-toggle="modal" data-bs-target="#editData{{ $datas->id }}"
                                                class="btn btn-warning btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-edit"></button>
                                            <a href="{{ route('spesialis.destroy', $datas->id) }}"
                                                class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"></a>
                                        </td>
                                    @endif
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @include('superadmin.spesialis.add')
    @include('superadmin.spesialis.edit')
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


            function ucwordsJS(str) {
                return str
                    .replace(/_/g, ' ') // ubah underscore ke spasi
                    .toLowerCase()
                    .replace(/\b\w/g, c => c.toUpperCase()); // huruf awal kapital
            }

            function printPDF() {
                // Menampilkan overlay loading
                console.log("Menampilkan overlay loading...");
                document.getElementById('loading-overlay').classList.remove('d-none');

                const {
                    jsPDF
                } = window.jspdf;
                let doc = new jsPDF();

                // Judul di tengah halaman
                let title = "Data Spesialis E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
                let pageWidth = doc.internal.pageSize.width;
                let titleWidth = doc.getTextWidth(title);
                doc.text(title, (pageWidth - titleWidth) / 2, 10); // Posisi tengah

                let table = document.querySelector("#example");
                let headers = [];
                let data = [];

                // Ambil header (tanpa kolom "Action")
                let headerCells = table.querySelectorAll("thead th");
                headerCells.forEach((th, index) => {
                    if (index !== headerCells.length - 1) { // Hapus kolom terakhir (Action)
                        headers.push(th.innerText);
                    }
                });

                // Ambil data tabel (tanpa kolom "Action")
                let rows = table.querySelectorAll("tbody tr");
                rows.forEach(row => {
                    let rowData = [];
                    let cells = row.querySelectorAll("td");
                    cells.forEach((td, index) => {
                        if (index !== cells.length - 1) { // Hapus kolom terakhir (Action)
                            rowData.push(td.innerText);
                        }
                    });
                    data.push(rowData);
                });

                // Generate PDF dengan autoTable
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

                // Unduh PDF
                doc.save("Data_Spesialis.pdf");

                // Sembunyikan overlay loading setelah PDF selesai
                console.log("Menyembunyikan overlay loading...");
                document.getElementById('loading-overlay').classList.add('d-none');
            }

            function exportExcel() {
                // Menampilkan overlay loading
                document.getElementById('loading-overlay').classList.remove('d-none');

                let table = document.getElementById("example");
                let ws = XLSX.utils.table_to_sheet(table);

                // Hapus kolom Action (Kolom terakhir)
                let range = XLSX.utils.decode_range(ws['!ref']);
                range.e.c -= 1; // Kurangi jumlah kolom terakhir
                ws['!ref'] = XLSX.utils.encode_range(range);

                // Set Auto Width
                let colWidths = [];
                for (let C = range.s.c; C <= range.e.c; C++) {
                    let maxWidth = 10; // Lebar default
                    for (let R = range.s.r; R <= range.e.r; R++) {
                        let cellAddress = XLSX.utils.encode_cell({
                            r: R,
                            c: C
                        });
                        let cell = ws[cellAddress];

                        if (cell && cell.v) {
                            let cellLength = cell.v.toString().length;
                            if (cellLength > maxWidth) {
                                maxWidth = cellLength;
                            }
                        }
                    }
                    colWidths.push({
                        wch: maxWidth + 2
                    });
                }

                ws['!cols'] = colWidths; // Terapkan auto width

                let wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, "Data Spesialis");

                // Menyimpan file Excel
                XLSX.writeFile(wb, "Data_Spesialis.xlsx");

                // Sembunyikan overlay loading setelah Excel selesai
                document.getElementById('loading-overlay').classList.add('d-none');
            }
        </script>
    @endpush
@endsection
