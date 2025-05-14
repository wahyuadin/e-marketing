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
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Data Daily Visit </h5>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData"><i
                                    class='bx bx-plus'></i></button>
                        @endif
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
                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        @include('alert')
                        <thead>
                            <tr>
                                <th style="width : 5%">No</th>
                                <th>Karyawan</th>
                                <th>Jabatan</th>
                                <th>Tanggal Target</th>
                                <th>Tanggal Realisasi</th>
                                <th>Dokter</th>
                                <th>Outlet</th>
                                <th>Spesialis</th>
                                <th>Keperluan</th>
                                <th>Waktu Kunjungan</th>
                                <th>Jenis Kunjungan</th>
                                <th>Keterangan</th>
                                <th>Status</th>
                                @if (Auth::user()->role == 'superadmin')
                                    <th>Google Maps</th>
                                @endif
                                <th>Foto Kunjungan</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $datas->user->nama ?? '-' }}</td>
                                    <td>{{ ucwords($datas->user->role ?? '-') ?? '-' }}</td>
                                    <td>{{ $datas->tanggal_target ?? '-' }}</td>
                                    <td>{{ $datas->tanggal_realisasi ?? '-' }}</td>
                                    <td>{{ $datas->dokter->dokter ?? '-' }}</td>
                                    <td>{{ $datas->instansi->instansi ?? '-' }}</td>
                                    <td>{{ $datas->dokter->spesialis->spesialis ?? '-' }}</td>
                                    <td>{{ ucwords($datas->keperluan ?? '-') }}</td>
                                    <td>{{ ucwords($datas->waktu_kunjungan ?? '-') }}</td>
                                    <td>{{ ucwords($datas->jenis_kunjungan ?? '-') }}</td>
                                    <td>{{ $datas->jenis_kunjungan_lainnya ?? '-' }}</td>
                                    <td>
                                        <span
                                            class="badge {{ $datas->status == 'selesai' ? 'bg-success' : ($datas->status == 'progress' ? 'bg-warning' : 'bg-danger') }}">
                                            {{ ucwords($datas->status) ?? '-' }}
                                        </span>
                                    </td>
                                    @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                                        <td>
                                            @if (empty($datas->latitude) || empty($datas->longitude))
                                                <span class="badge bg-danger">Lokasi Tidak Tersedia</span>
                                            @else
                                                <a href="https://www.google.com/maps?q={{ $datas->latitude }},{{ $datas->longitude }}"
                                                    class="btn btn-secondary btn-sm" target="_blank">
                                                    <i class="bx bx-map"></i> Lihat di Maps
                                                </a>
                                            @endif
                                        </td>
                                    @endif
                                    <td>
                                        @if (!empty($datas->keterangan))
                                            <a href="{{ asset('assets/dailyvisit/' . $datas->keterangan) }}"
                                                target="_blank">
                                                <img src="{{ asset('assets/dailyvisit/' . $datas->keterangan) }}"
                                                    alt="{{ $datas->keterangan }}" class="rounded shadow-sm"
                                                    style="width: 100px; height: 100px; object-fit: cover; max-width: 100%;">
                                            </a>
                                        @else
                                            <span class="badge bg-danger">Tidak ada foto</span>
                                        @endif
                                    </td>
                                    <td class="d-flex flex-column flex-sm-row gap-2">
                                        <button data-bs-toggle="modal" data-bs-target="#editData{{ $datas->id }}"
                                            class="btn btn-warning btn-sm bx bx-edit" title="Edit"></button>
                                        @if (Auth::user()->role == 'superadmin')
                                            <a href="{{ route('daily-visit.destroy', $datas->id) }}"
                                                class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"
                                                title="Hapus"></a>
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
    @include('superadmin.dailyvisit.add')
    @include('superadmin.dailyvisit.edit')

    @push('style')
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
    @endpush

    @push('scripts')
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>

        <script>
            new DataTable('#example');

            function ucwordsJS(str) {
                return str
                    .replace(/_/g, ' ')
                    .toLowerCase()
                    .replace(/\b\w/g, char => char.toUpperCase());
            }

            function printPDF() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                const {
                    jsPDF
                } = window.jspdf;
                let doc = new jsPDF();

                let title = "DATA DAILY VISIT E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
                let pageWidth = doc.internal.pageSize.width;
                let titleWidth = doc.getTextWidth(title);
                doc.text(title, (pageWidth - titleWidth) / 2, 10);

                let table = $('#example').DataTable();
                let headers = [];
                $('#example thead th').each(function() {
                    headers.push($(this).text().trim());
                });
                headers.splice(-3);

                let data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    let row = this.data();
                    let rowData = $(row).map(function(i, val) {
                        let text = $('<div>').html(val).text().trim();
                        return ucwordsJS(text);
                    }).get();
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

                doc.save("Daily_visit.pdf");
                document.getElementById('loading-overlay').classList.add('d-none');
            }

            function exportExcel() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                let table = $('#example').DataTable();

                // Ambil header dan potong 3 kolom terakhir
                let headers = [];
                $('#example thead th').each(function(index) {
                    headers.push($(this).text().trim());
                });
                headers = headers.slice(0, headers.length - 3); // hanya sampai "Waktu Kunjungan"

                let data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    let row = this.node(); // ambil node HTML
                    let cells = $('td', row);

                    // Ambil hanya kolom yang dibutuhkan (tanpa kolom Maps, Keterangan, Action)
                    let rowData = [];
                    cells.each(function(index) {
                        if (index < headers.length) { // ambil sampai batas header
                            let text = $('<div>').html($(this).html()).text().trim();
                            rowData.push(ucwordsJS(text));
                        }
                    });
                    data.push(rowData);
                });

                let ws_data = [headers, ...data];
                let ws = XLSX.utils.aoa_to_sheet(ws_data);

                // Set kolom width otomatis
                let colWidths = ws_data[0].map((_, colIndex) => {
                    let maxWidth = 10;
                    ws_data.forEach(row => {
                        let cell = row[colIndex];
                        if (cell && cell.length > maxWidth) {
                            maxWidth = cell.length;
                        }
                    });
                    return {
                        wch: maxWidth + 3
                    };
                });
                ws['!cols'] = colWidths;

                let wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, "Daily visit");

                XLSX.writeFile(wb, "Daily_visit.xlsx");
                document.getElementById('loading-overlay').classList.add('d-none');
            }
        </script>
    @endpush
@endsection
