@extends('template.app')
@section('content')
    <!-- Start of Selection -->
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Data Daftar Laporan </h5>
                    </div>
                </div>
                <div class="mt-3">
                    <div class="row mt-4">
                        <div class="nav-align-top nav-tabs-shadow">
                            <ul class="nav nav-tabs nav-fill" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"
                                        data-bs-target="#navs-justified-home" aria-controls="navs-justified-home"
                                        aria-selected="true">
                                        <span class="d-none d-sm-inline-flex align-items-center">
                                            <i class="icon-base fa-solid fa-fingerprint icon-sm me-1_5"></i>
                                        </span>
                                        Absensi
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                                        data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile"
                                        aria-selected="false">
                                        <span class="d-none d-sm-inline-flex align-items-center">
                                            <i class="icon-base fa-solid fa-street-view icon-sm me-1_5"></i>
                                        </span>
                                        Daily Visit
                                    </button>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="navs-justified-home" role="tabpanel">
                                    <div class="table-responsive mt-3">
                                        <div class="mt-3 mb-4">
                                            <button type="button" class="btn btn-secondary dropdown-toggle"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class='bx bx-export'></i>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="javascript:void(0)"
                                                        onclick="printPDF()">Print PDF</a></li>
                                                <li><a class="dropdown-item" href="javascript:void(0)"
                                                        onclick="exportExcel()">Export Excel</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <table id="example2" class="table table-striped table-bordered w-100">
                                            <thead>
                                                <tr>
                                                    <th style="width : 5%">No</th>
                                                    <th>User</th>
                                                    <th>Jabatan</th>
                                                    <th>Regional</th>
                                                    <th>Area</th>
                                                    <th>AM</th>
                                                    <th>RSM</th>
                                                    <th>Cabang</th>
                                                    <th>Tanggal</th>
                                                    <th>Waktu</th>
                                                    <th>Terlambat</th>
                                                    <th>Keterangan</th>
                                                    <th>Status</th>
                                                    @if (Auth::user()->role == 'Admin' || Auth::user()->role == 'superadmin' || Auth::user()->role == 'NSM')
                                                        <th>Google Maps</th>
                                                    @endif
                                                    <th style="width: 20%">Foto Kunjungan</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @php
                                                    $no = 1;
                                                @endphp
                                                @foreach ($absensi as $absensis)
                                                    <tr>
                                                        <th>{{ $no++ }}</th>
                                                        <th>{{ $absensis->user->nama ?? '-' }}</th>
                                                        <th>{{ $absensis->user->role ?? '-' }}</th>
                                                        @if ($absensis->user->role != 'mr')
                                                            <th>
                                                                {{ $absensis->user->wilayah->first()?->wilayah ?? '-' }}
                                                            </th>
                                                        @else
                                                            <th>{{ $absensis->user->wilayahDetail->first()?->area->area ?? '-' }}
                                                            </th>
                                                        @endif
                                                        @if ($absensis->user->role != 'mr')
                                                            <th>{{ $absensis->user->wilayah->first()?->regionalDetail->first()?->region->region ?? '-' }}
                                                            </th>
                                                        @else
                                                            <th>{{ $absensis->user->wilayahDetail->first()?->wilayah?->regionalDetail->first()?->region?->region ?? '-' }}
                                                            </th>
                                                        @endif
                                                        @if ($absensis->user->role != 'mr')
                                                            <th>{{ $absensis->user->wilayah->first()?->user->nama ?? '-' }}
                                                            </th>
                                                        @else
                                                            <th>{{ $absensis->user->wilayahDetail->first()?->wilayah->user->nama ?? '-' }}
                                                            </th>
                                                        @endif
                                                        @if ($absensis->user->role != 'mr')
                                                            <th>{{ $absensis->user->wilayah->first()?->regionalDetail->first()?->region?->user->nama ?? '-' }}
                                                            </th>
                                                        @else
                                                            <th>{{ $absensis->user->wilayahDetail->first()?->wilayah?->regionalDetail->first()?->region?->user->nama ?? '-' }}
                                                            </th>
                                                        @endif
                                                        @if ($absensis->user->role != 'mr')
                                                            <th>{{ $absensis->user->wilayah->first()?->wilayahdetails->first()?->area->area ?? '-' }}
                                                            </th>
                                                        @else
                                                            <th>{{ $absensis->user->wilayahDetail->first()?->area->area ?? '-' }}
                                                            </th>
                                                        @endif
                                                        <th>{{ $absensis->tanggal ?? '-' }}</th>
                                                        <th>{{ $absensis->waktu ?? '-' }} WIB</th>
                                                        @php
                                                            $jamMasuk = strtotime($absensis->waktu);
                                                            $jamTepat = strtotime('08:00:00');

                                                            if ($jamMasuk > $jamTepat) {
                                                                $diffInSeconds = $jamMasuk - $jamTepat;
                                                                $lateMinutes = round($diffInSeconds / 60);

                                                                $jam = floor($lateMinutes / 60);
                                                                $menit = $lateMinutes % 60;

                                                                $lateDisplay = $jam . ' jam ' . $menit . ' menit';
                                                            } else {
                                                                $lateDisplay = '-';
                                                            }
                                                        @endphp

                                                        <th>{{ $lateDisplay }}</th>

                                                        <th>{{ $absensis->keterangan ?? '-' }}</th>
                                                        <th>
                                                            <span
                                                                class="badge {{ $absensis->status == 'luar_kota' ? 'bg-warning' : ($absensis->status == 'dalam_kota' ? 'bg-success' : '') }}">
                                                                {{ str_replace('_', ' ', $absensis->status) }}
                                                            </span>
                                                            {{ $absensis->status == null ? '-' : '' }}
                                                        </th>
                                                        @if (Auth::user()->role == 'Admin' || Auth::user()->role == 'superadmin' || Auth::user()->role == 'NSM')
                                                            <th>
                                                                @if (empty($absensis->latitude) || empty($absensis->longitude))
                                                                    <span class="badge bg-danger">Lokasi Tidak
                                                                        Tersedia</span>
                                                                @else
                                                                    <a href="https://www.google.com/maps?q={{ $absensis->latitude }},{{ $absensis->longitude }}"
                                                                        class="btn btn-secondary btn-sm" target="_blank">
                                                                        <i class="bx bx-map"></i> Maps
                                                                    </a>
                                                                @endif
                                                            </th>
                                                        @endif
                                                        <th>
                                                            @if (!empty($absensis->foto_marki))
                                                                <a href="{{ asset('assets/foto_marki/' . $absensis->foto_marki) }}"
                                                                    target="_blank">
                                                                    <img src="{{ asset('assets/foto_marki/' . $absensis->foto_marki) }}"
                                                                        alt="Foto Marki" class="rounded shadow-sm"
                                                                        style="width: 100px; height: 100px; object-fit: cover; max-width: 100%;">
                                                                </a>
                                                            @else
                                                                <span class="badge bg-danger">Tidak ada foto</span>
                                                            @endif
                                                        </th>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
                                    <div class="table-responsive mt-3">
                                        <div class="mt-3 mb-4">
                                            <button type="button" class="btn btn-secondary dropdown-toggle"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class='bx bx-export'></i>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="javascript:void(0)"
                                                        onclick="printPDF()">Print PDF</a></li>
                                                <li><a class="dropdown-item" href="javascript:void(0)"
                                                        onclick="exportExcel()">Export Excel</a>
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
                                                    @if (auth()->user()->role == 'admin' || auth()->user()->role == 'superadmin' || auth()->user()->role == 'NSM')
                                                        <th>Google Maps</th>
                                                    @endif
                                                    <th>Foto Kunjungan</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @php
                                                    $no2 = 1;
                                                @endphp
                                                @foreach ($dailyvisit as $datas2)
                                                    <tr>
                                                        <td>{{ $no2++ }}</td>
                                                        <td>{{ $datas2->user->nama ?? '-' }}</td>
                                                        <td>{{ strtoupper($datas2->user->role ?? '-') }}</td>
                                                        <td>{{ $datas2->tanggal_target ?? '-' }}</td>
                                                        <td>{{ $datas2->tanggal_realisasi ?? '-' }}</td>
                                                        <td>{{ $datas2->dokter->dokter ?? '-' }}</td>
                                                        <td>{{ $datas2->dokter->instansi->instansi ?? '-' }}</td>
                                                        <td>{{ $datas2->spesialis ?? '-' }}</td>
                                                        <td>{{ $datas2->keperluan ?? '-' }}</td>
                                                        <td>{{ ucwords($datas2->waktu_kunjungan) ?? '-' }}</td>
                                                        <td>{{ ucwords($datas2->jenis_kunjungan ?? '-') }}</td>
                                                        <td>{{ $datas2->jenis_kunjungan_lainnya ?? '-' }}</td>
                                                        @if (auth()->user()->role == 'admin' || auth()->user()->role == 'superadmin' || auth()->user()->role == 'NSM')
                                                            <td>
                                                                @if (empty($datas2->latitude) || empty($datas2->longitude))
                                                                    <span class="badge bg-danger">Lokasi Tidak
                                                                        Tersedia</span>
                                                                @else
                                                                    <a href="https://www.google.com/maps?q={{ $datas2->latitude }},{{ $datas2->longitude }}"
                                                                        class="btn btn-secondary btn-sm" target="_blank">
                                                                        <i class="bx bx-map"></i> Lihat di Maps
                                                                    </a>
                                                                @endif
                                                            </td>
                                                        @endif
                                                        <td>
                                                            <span
                                                                class="badge {{ $datas2->status == 'selesai' ? 'bg-success' : ($datas2->status == 'progress' ? 'bg-warning' : 'bg-danger') }}">
                                                                {{ ucwords($datas2->status) ?? '-' }}
                                                            </span>
                                                        </td>
                                                        <td>
                                                            @if (!empty($datas2->keterangan))
                                                                <a href="{{ asset('assets/dailyvisit/' . $datas2->keterangan) }}"
                                                                    target="_blank">
                                                                    <img src="{{ asset('assets/dailyvisit/' . $datas2->keterangan) }}"
                                                                        alt="{{ $datas2->keterangan }}"
                                                                        class="rounded shadow-sm"
                                                                        style="width: 100px; height: 100px; object-fit: cover; max-width: 100%;">
                                                                </a>
                                                                <div class="foto-print d-none" id="foto-print">
                                                                    <p>{{ $datas2->keterangan }}</p>
                                                                </div>
                                                            @else
                                                                <span class="badge bg-danger">Tidak ada foto</span>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    @push('style')
        {{-- datatable --}}
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
    @endpush

    @push('scripts')
        {{-- DataTables --}}
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>
        <script>
            new DataTable('#example');
            new DataTable('#example2');
        </script>

        {{-- jsPDF dan autoTable --}}
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>

        {{-- SheetJS --}}
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

        <script>
            // Fungsi untuk format header
            function formatHeader(text) {
                return text.replace(/_/g, ' ')
                    .replace(/\w\S*/g, function(txt) {
                        return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
                    });
            }

            // Export ke PDF
            async function printPDF() {
                const {
                    jsPDF
                } = window.jspdf;
                const doc = new jsPDF({
                    orientation: "landscape"
                });

                const table = document.querySelector('.tab-pane.active table');

                const headers = [...table.querySelectorAll('thead th')]
                    .map(th => formatHeader(th.textContent.trim()))
                    .filter((_, i) => i !== 8 && i !== 9);

                const rows = [...table.querySelectorAll('tbody tr')].map(tr => [...tr.querySelectorAll('td,th')]
                    .map(td => td.innerText.trim())
                    .filter((_, i) => i !== 8 && i !== 9) // Hapus Foto Marki & Google Maps
                );

                doc.autoTable({
                    head: [headers],
                    body: rows,
                    startY: 10,
                    styles: {
                        fontSize: 8,
                        overflow: 'linebreak',
                    },
                    headStyles: {
                        fillColor: [52, 58, 64],
                        textColor: 255,
                    },
                    theme: 'striped',
                    margin: {
                        top: 10,
                        left: 10,
                        right: 10
                    }
                });

                doc.save("Laporan_Data.pdf");
            }

            // Export ke Excel
            function exportExcel() {
                const table = document.querySelector('.tab-pane.active table');
                const clonedTable = table.cloneNode(true);

                // 👉 Hapus kolom ke-9 (Foto Marki) & ke-10 (Google Maps) dari seluruh baris
                clonedTable.querySelectorAll('tr').forEach(row => {
                    const cells = row.querySelectorAll('th, td');
                    if (cells.length >= 15) {
                        cells[14].remove(); // Google Maps
                        cells[13].remove(); // Foto Marki
                    }
                });

                // Sekarang baru lanjut proses Excel
                const headerCells = clonedTable.querySelectorAll('thead th');
                headerCells.forEach(th => {
                    th.textContent = formatHeader(th.textContent.trim());
                });

                const bodyCells = clonedTable.querySelectorAll('tbody td, tbody th');
                bodyCells.forEach(cell => {
                    cell.textContent = formatHeader(cell.innerText.trim());
                });

                const workbook = XLSX.utils.book_new();
                const ws = XLSX.utils.table_to_sheet(clonedTable);

                // Auto-width
                const range = XLSX.utils.decode_range(ws['!ref']);
                const colWidths = [];
                for (let C = range.s.c; C <= range.e.c; ++C) {
                    let maxWidth = 10;
                    for (let R = range.s.r; R <= range.e.r; ++R) {
                        const cellRef = XLSX.utils.encode_cell({
                            c: C,
                            r: R
                        });
                        const cell = ws[cellRef];
                        if (cell && cell.v) {
                            const value = cell.v.toString();
                            maxWidth = Math.max(maxWidth, value.length);
                        }
                    }
                    colWidths.push({
                        wch: maxWidth + 2
                    });
                }
                ws['!cols'] = colWidths;

                XLSX.utils.book_append_sheet(workbook, ws, "Laporan");
                XLSX.writeFile(workbook, "Laporan_Data.xlsx");
            }
        </script>
    @endpush
@endsection
