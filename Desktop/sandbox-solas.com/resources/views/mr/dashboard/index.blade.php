@extends('template.app')

@section('content')
    <div class="container-xxl py-3">
        <div class="row gy-4">
            {{-- Pengumuman --}}
            <div class="{{ isset($pengumuman) && count($pengumuman) > 0 ? 'col-md-12' : 'd-none' }}">
                <div class="card shadow-sm">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="card-title m-0"><i class='bx bxs-megaphone bx-sm me-2'></i> Pengumuman</h5>
                        {{-- Anda bisa menambahkan tombol atau link "Lihat Semua" jika perlu --}}
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled mb-0">
                            @forelse ($pengumuman as $item)
                                <li class="mb-3 card shadow-sm" style="border-left: 5px solid #00BCD4;">
                                    {{-- Menambahkan card dan border indikator --}}
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-sm">
                                                    <i class="fa-solid fa-circle-info"></i>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <h5 class="mb-1 fw-semibold">{{ $item->title }}</h5> {{-- Membuat judul lebih menonjol --}}
                                                <h6 class="text-muted mb-2">Tanggal:
                                                    {{ \Carbon\Carbon::parse($item->tanggal)->format('d-m-Y') }}</h6>
                                                {{-- Memberikan sedikit margin bawah --}}
                                                <p class="mb-1">Publish oleh: <span
                                                        class="fw-medium">{{ $item->user->nama }}</span></p>
                                                {{-- Menekankan nama --}}
                                                <p class="mb-0 text-truncate" style="max-height: 40px; color: #6c757d;">
                                                    {{-- Warna teks konten --}}
                                                    {{ Str::limit($item->content, 100) }}
                                                </p>
                                                <button type="button" class="btn btn-sm btn-outline-primary mt-2"
                                                    {{-- Memberikan margin atas pada tombol --}} data-bs-toggle="modal"
                                                    data-bs-target="#pengumumanModal{{ $item->id }}">
                                                    Selengkapnya
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                {{-- Modal untuk setiap pengumuman --}}
                                <div class="modal fade" id="pengumumanModal{{ $item->id }}" tabindex="-1"
                                    aria-labelledby="pengumumanModalLabel{{ $item->id }}" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered modal-lg"> {{-- Menambahkan modal-lg untuk lebar yang lebih besar jika konten panjang --}}
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title d-flex align-items-center"
                                                    id="pengumumanModalLabel{{ $item->id }}">
                                                    <i class='bx bx-bullhorn me-2'></i> {{ $item->title }}
                                                    {{-- Menambahkan ikon di samping judul --}}
                                                </h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="mb-3">
                                                    <small class="text-muted"><i class='bx bx-calendar me-1'></i> Tanggal:
                                                        {{ \Carbon\Carbon::parse($item->tanggal)->format('d-m-Y H:i:s') }}</small>
                                                </div>
                                                <div class="mb-3">
                                                    <small class="text-muted"><i class='bx bx-user me-1'></i> Oleh:
                                                        <span class="fw-semibold">{{ $item->user->nama }}</span></small>
                                                </div>
                                                <p>{{ $item->content }}</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Tutup</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @empty
                                <li>
                                    <div class="d-flex align-items-center">
                                        <div class="flex-grow-1 text-center">
                                            <p class="mb-0">Tidak ada pengumuman saat ini.</p>
                                        </div>
                                    </div>
                                </li>
                            @endforelse
                        </ul>
                    </div>
                </div>
            </div>
            {{-- End Pengumuman --}}

            <div class="col-lg-12 mb-4">
                <div class="row gy-4">
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body d-flex flex-column align-items-center justify-content-center p-4">
                                <div class="avatar flex-shrink-0 mb-3">
                                    <span class="avatar-initial rounded" style="background-color: #E0F7FA; color: #00BCD4;">
                                        <i class='bx bxs-user-account bx-sm'></i>
                                    </span>
                                </div>
                                <h5 class="card-title text-center mb-1">Absensi Bulan {{ date('F') }}</h5>
                                <p class="card-text text-center fw-bold h3">{{ $absensibulanan }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body d-flex flex-column align-items-center justify-content-center p-4">
                                <div class="avatar flex-shrink-0 mb-3">
                                    <span class="avatar-initial rounded" style="background-color: #E0F7FA; color: #00BCD4;">
                                        <i class="fas fa-sign-out-alt fa-sm"></i>
                                    </span>
                                </div>
                                <h5 class="card-title text-center mb-1">Dalam Kota</h5>
                                <p class="card-text text-center fw-bold h3">{{ $absensidalamkota }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body d-flex flex-column align-items-center justify-content-center p-4">
                                <div class="avatar flex-shrink-0 mb-3">
                                    <span class="avatar-initial rounded" style="background-color: #E0F7FA; color: #00BCD4;">
                                        <i class="fa-solid fa-users fa-sm"></i>
                                    </span>
                                </div>
                                <h5 class="card-title text-center mb-1">Luar Kota</h5>
                                <p class="card-text text-center fw-bold h3">{{ $absensiluarkota }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body d-flex flex-column align-items-center justify-content-center p-4">
                                <div class="avatar flex-shrink-0 mb-3">
                                    <span class="avatar-initial rounded" style="background-color: #E0F7FA; color: #00BCD4;">
                                        <i class="fa-solid fa-users-slash fa-sm"></i>
                                    </span>
                                </div>
                                <h5 class="card-title text-center mb-1">Absensi Izin</h5>
                                <p class="card-text text-center fw-bold h3">{{ $absensiizin }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-8 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="card-title m-0">Statistik Kunjungan Berdasarkan Target</h5>
                        <small class="text-muted">Dokter & Outlet tahun {{ date('Y') }}</small>
                    </div>
                    <div class="card-body">
                        <canvas id="visitTargetChart" style="min-height: 300px;"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="card-title m-0">Statistik Kunjungan</h5>
                            <select id="timeRangeSelector" class="form-select w-auto">
                                <option value="7">7 Hari</option>
                                <option value="30">1 Bulan</option>
                                <option value="90">3 Bulan</option>
                            </select>
                        </div>
                        <div class="chart-container">
                            <canvas id="visitStatisticsChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                        <div class="card-title mb-0">
                            <h5 class="m-0 me-2">Jadwal Kunjungan Tanggal {{ \carbon\Carbon::now()->format('d-m-Y') }}
                            </h5>
                        </div>
                    </div>
                    <div class="card-body mt-4">
                        <div class="table-responsive">
                            <table id="example" class="table table-bordered w-100">
                                <thead>
                                    <tr>
                                        <th>Tanggal</th>
                                        <th>Keterangan</th>
                                        <th>Dokter</th>
                                        <th>Outlet</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse ($kunjunganhariini as $item)
                                        <tr>
                                            <td>{{ $item->tanggal }}</td>
                                            <td>{{ $item->keterangan }}</td>
                                            <td>{{ $item->DailyVisit->dokter->dokter ?? '-' }}</td>
                                            <td>{{ $item->DailyVisit->instansi->instansi ?? '-' }}</td>
                                            <td>
                                                <span
                                                    class="badge {{ $item->DailyVisit->status == 'selesai' ? 'bg-success' : ($item->DailyVisit->status == 'progress' ? 'bg-warning' : 'bg-danger') }}">
                                                    {{ ucfirst($item->DailyVisit->status) }}
                                                </span>
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
@endsection

@push('style')
    {{-- datatable --}}
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
@endpush
@push('scripts')
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>

    {{-- Library untuk Export Excel --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

    {{-- Library untuk Export PDF --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        new DataTable('#example');
        const chartLabels = @json($labels);
        const chartData = {
            7: @json($data_7),
            30: @json($data_30),
            90: @json($data_90)
        };
        const visitChart = new Chart(document.getElementById('visitStatisticsChart'), {
            type: 'pie',
            data: {
                labels: chartLabels,
                datasets: [{
                    data: chartData[7], // default
                    backgroundColor: [
                        'rgba(173, 216, 230, 0.8)', // Biru Muda
                        'rgba(144, 238, 144, 0.8)', // Hijau Terang
                        'rgba(255, 99, 132, 0.8)' // Merah
                    ],
                    borderColor: [
                        'rgba(173, 216, 230, 1)',
                        'rgba(144, 238, 144, 1)',
                        'rgba(255, 99, 132, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            usePointStyle: true
                        }
                    }
                }
            }
        });

        document.getElementById('timeRangeSelector').addEventListener('change', function() {
            const value = this.value;
            visitChart.data.datasets[0].data = chartData[value];
            visitChart.update();
        });
    </script>
    <script>
        // Inisialisasi chart untuk Statistik Kunjungan Berdasarkan Target
        const visitTargetCtx = document.getElementById('visitTargetChart');
        new Chart(visitTargetCtx, {
            type: 'bar',
            data: {
                labels: ['7 Hari', '1 Bulan', '3 Bulan'],
                datasets: [{
                        label: 'Dokter',
                        data: [
                            {{ $dokterStats['7'] }},
                            {{ $dokterStats['30'] }},
                            {{ $dokterStats['90'] }}
                        ],
                        backgroundColor: 'rgba(173, 216, 230, 0.8)', // Biru Muda
                        borderColor: 'rgba(173, 216, 230, 1)',
                        borderWidth: 1,
                        borderRadius: 8
                    },
                    {
                        label: 'Outlet',
                        data: [
                            {{ $instansiStats['7'] }},
                            {{ $instansiStats['30'] }},
                            {{ $instansiStats['90'] }}
                        ],
                        backgroundColor: 'rgba(70, 130, 180, 0.8)', // Biru Sedang
                        borderColor: 'rgba(70, 130, 180, 1)',
                        borderWidth: 1,
                        borderRadius: 8
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            font: {
                                size: 12
                            }
                        }
                    },
                    x: {
                        ticks: {
                            font: {
                                size: 12
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            font: {
                                size: 12
                            },
                            usePointStyle: true
                        }
                    },
                    tooltip: {
                        backgroundColor: 'rgba(255, 255, 255, 0.9)',
                        titleColor: '#000',
                        bodyColor: '#666',
                        borderColor: 'rgba(0, 0, 0, 0.1)',
                        borderWidth: 1,
                        padding: 12,
                        cornerRadius: 8,
                        displayColors: false
                    }
                }
            }
        });
    </script>
@endpush
