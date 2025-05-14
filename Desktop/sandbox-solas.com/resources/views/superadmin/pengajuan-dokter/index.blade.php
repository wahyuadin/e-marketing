@extends('template.app')
@section('content')
    @php
        $user = json_decode(Cookie::get('user_data'), true);
    @endphp

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
                        <h5 class="card-title">Pengajuan Dokter</h5>
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
                                <th>Tanggal</th>
                                <th>Nama Pengaju</th>
                                <th>Nama Dokter</th>
                                <th>Spesialis</th>
                                <th>Cabang</th>
                                <th>AM</th>
                                <th>Area</th>
                                <th>Email</th>
                                <th>No Hp (Whatsapp)</th>
                                <th>Alamat Rumah</th>
                                <th>Alamat Praktek</th>
                                <th>Outlet</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ \Carbon\Carbon::parse($datas->created_at)->format('d-m-Y H:i') ?? '-' }}</td>
                                    <td>{{ $datas->user->nama ?? '-' }}</td>
                                    <td>{{ $datas->dokter ?? '-' }}</td>
                                    <td>{{ $datas->spesialis->spesialis ?? '-' }}</td>
                                    <td>{{ $datas->wilayah->wilayah ?? '-' }}</td>
                                    <td>{{ $datas->wilayah->user->nama ?? '-' }}</td>
                                    <td>{{ $datas->area ?? '-' }}</td>
                                    <td>{{ $datas->email ?? '-' }}</td>
                                    <td>{{ $datas->no_hp ?? '-' }}</td>
                                    <td>{{ $datas->alamat_rumah ?? '-' }}</td>
                                    <td>{{ $datas->alamat_praktek ?? '-' }}</td>
                                    <td>{{ $datas->instansi->instansi ?? '-' }}</td>
                                    <td>
                                        <span
                                            class="badge {{ $datas->status == 'pending' ? 'bg-warning' : ($datas->status == 'approved' ? 'bg-success' : 'bg-danger') }}">
                                            {{ ucfirst($datas->status) }}
                                        </span>
                                    </td>
                                    <td class="d-flex flex-column flex-sm-row">
                                        <button data-bs-toggle="modal" data-bs-target="#detailData{{ $datas->id }}"
                                            class="btn btn-primary btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-detail"></button>
                                        @if (Auth::user()->role == 'superadmin')
                                            <a href="{{ route('pengajuan-dokter.destroy', $datas->id) }}"
                                                class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"></a>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @include('superadmin.pengajuan-dokter.add')
    @include('superadmin.pengajuan-dokter.detail')
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

            function printPDF() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                const {
                    jsPDF
                } = window.jspdf;
                let doc = new jsPDF('landscape'); // Menambahkan 'landscape' di sini

                let title = "DATA PENGAJUAN DOKTER E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
                let pageWidth = doc.internal.pageSize.width;
                let titleWidth = doc.getTextWidth(title);
                doc.text(title, (pageWidth - titleWidth) / 2, 10);

                let table = $('#example').DataTable();
                let headers = [];
                $('#example thead th').each(function() {
                    headers.push($(this).text().trim());
                });
                headers.splice(-1); // Menghapus kolom terakhir jika perlu

                let data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    let row = this.node();
                    let rowData = [];
                    $(row).find('td').each(function() {
                        rowData.push($(this).text().trim()); // Ambil teks tanpa HTML
                    });
                    rowData.splice(-1); // Menghapus kolom terakhir jika perlu
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

                doc.save("Pengajuan_Dokter.pdf");
                document.getElementById('loading-overlay').classList.add('d-none');
            }

            function exportExcel() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                let table = $('#example').DataTable();
                let headers = [];
                $('#example thead th').each(function() {
                    headers.push($(this).text().trim());
                });
                headers.splice(-1); // Menghapus kolom terakhir jika perlu

                let data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    let row = this.node();
                    let rowData = [];
                    $(row).find('td').each(function() {
                        rowData.push($(this).text().trim()); // Ambil teks tanpa HTML
                    });
                    rowData.splice(-1); // Menghapus kolom terakhir jika perlu
                    data.push(rowData);
                });

                let ws_data = [headers, ...data];
                let ws = XLSX.utils.aoa_to_sheet(ws_data);

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

                let wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, "Pengajuan Dokter");

                XLSX.writeFile(wb, "Pengajuan_Dokter.xlsx");
                document.getElementById('loading-overlay').classList.add('d-none');
            }
        </script>
    @endpush
@endsection
