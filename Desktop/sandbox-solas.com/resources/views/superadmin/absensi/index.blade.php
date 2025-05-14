@extends('template.app')
@section('content')
    @php
        $user = json_decode(Cookie::get('data'), true);
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
                        <h5 class="card-title">Data Absensi</h5>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData"><i
                                class='bx bx-plus'></i>
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
                    {{-- <h5>{{ Auth::user()->nip }} - {{ Auth::user()->nama }} [{{ Auth::user()->role }}]</h5> --}}
                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        @include('alert')
                        <thead>
                            <tr>
                                <th style="width : 5%">No</th>
                                <th>User</th>
                                <th>Jabatan</th>
                                <th>Tanggal</th>
                                <th>Waktu</th>
                                <th>Keterangan</th>
                                <th>Status</th>
                                <th>Foto Marki</th>
                                @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                                    <th>Google Maps</th>
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                @php
                                    $isLate =
                                        strtotime($datas->waktu) >= strtotime('08:00:00') &&
                                        strtotime($datas->waktu) <= strtotime('23:59:00') &&
                                        trim($datas->keterangan ?? '') == 'masuk';

                                @endphp

                                <tr style="background-color: {{ $isLate ? '#ff0000e6' : '' }}">
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">{{ $index + 1 }}</td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">{{ $datas->user->nama ?? '-' }}
                                    </td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">
                                        {{ ucwords($datas->user->role) ?? '-' }}
                                    </td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">{{ $datas->tanggal ?? '-' }}
                                    </td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">
                                        <b>{{ $datas->waktu ? $datas->waktu . ' WIB' : '-' }}</b>
                                    </td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">
                                        {{ strtoupper($datas->keterangan ?? '-') }}
                                    </td>
                                    <td>
                                        <span
                                            class="badge {{ $datas->status == 'luar_kota' ? 'bg-warning' : ($datas->status == 'dalam_kota' ? 'bg-success' : '') }}">
                                            {{ str_replace('_', ' ', ucfirst($datas->status)) }}
                                        </span>
                                        {{ $datas->status == null ? '-' : '' }}
                                    </td>
                                    <td>
                                        @if (!empty($datas->foto_marki))
                                            <a href="{{ asset('assets/foto_marki/' . $datas->foto_marki) }}"
                                                target="_blank">
                                                <img src="{{ asset('assets/foto_marki/' . $datas->foto_marki) }}"
                                                    alt="Foto Marki" class="rounded shadow-sm"
                                                    style="width: 100px; height: 100px; object-fit: cover; max-width: 100%;">
                                            </a>
                                        @else
                                            <span class="badge bg-danger">Tidak ada foto</span>
                                        @endif
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
                                        <td class="d-flex flex-column flex-sm-row gap-2">
                                            <!-- Tombol Edit -->
                                            <button data-bs-toggle="modal" data-bs-target="#editData{{ $datas->id }}"
                                                class="btn btn-warning btn-sm bx bx-edit" title="Edit">
                                            </button>
                                            @if (Auth::user()->role == 'admin' || Auth::user()->role == 'superadmin')
                                                <!-- Tombol Detail -->
                                                {{-- <button data-bs-toggle="modal" data-bs-target="#detailData{{ $datas->id }}"
                                    class="btn btn-info btn-sm bx bx-detail">
                                    </button> --}}

                                                <!-- Tombol Hapus -->
                                                <a href="{{ route('absensi.destroy', $datas->id) }}"
                                                    class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"
                                                    title="Hapus">
                                                </a>
                                            @endif
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
    @include('superadmin.absensi.add')
    @include('superadmin.absensi.edit')
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

        {{-- Library untuk Export PDF --}}
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>

        <script>
            new DataTable('#example', {
                lengthMenu: [
                    [10, 30, 50, 100, -1], // Nilai
                    [10, 30, 50, 100, 'All'] // Label
                ],
            });

            function ucwordsJS(str) {
                return str
                    .replace(/_/g, ' ') // ganti underscore jadi spasi
                    .toLowerCase()
                    .replace(/\b\w/g, function(char) {
                        return char.toUpperCase();
                    });
            }

            function printPDF() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                const {
                    jsPDF
                } = window.jspdf;
                let doc = new jsPDF();

                let title = "DATA ABSENSI E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
                let pageWidth = doc.internal.pageSize.width;
                let titleWidth = doc.getTextWidth(title);
                doc.text(title, (pageWidth - titleWidth) / 2, 10);

                // Ambil header
                let headers = [];
                $('#example thead th').each(function(index) {
                    if (index < 7) { // Hanya ambil kolom yang relevan
                        headers.push($(this).text().trim());
                    }
                });

                // Ambil data dari tabel DOM
                let data = [];
                $('#example tbody tr:visible').each(function() {
                    let rowData = [];
                    $(this).find('td').each(function(index) {
                        if (index < 7) { // Ambil hanya kolom yang relevan
                            let text = $(this).text().trim();
                            rowData.push(ucwordsJS(text));

                        }
                    });
                    data.push(rowData);
                });

                // Buat tabel PDF
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

                doc.save("Data_Absensi.pdf");
                document.getElementById('loading-overlay').classList.add('d-none');
            }

            function exportExcel() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                // Ambil header
                let headers = [];
                $('#example thead th').each(function(index) {
                    if (index < 7) {
                        headers.push($(this).text().trim());
                    }
                });

                // Ambil data dari DOM
                let data = [];
                $('#example tbody tr:visible').each(function() {
                    let rowData = [];
                    $(this).find('td').each(function(index) {
                        if (index < 7) {
                            let text = $(this).text().trim();
                            rowData.push(ucwordsJS(text));
                        }
                    });
                    data.push(rowData);
                });

                let ws_data = [headers, ...data];
                let ws = XLSX.utils.aoa_to_sheet(ws_data);

                // Hitung lebar kolom
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
                XLSX.utils.book_append_sheet(wb, ws, "Data Absensi");

                XLSX.writeFile(wb, "Data_Absensi.xlsx");
                document.getElementById('loading-overlay').classList.add('d-none');
            }
        </script>
    @endpush
@endsection
