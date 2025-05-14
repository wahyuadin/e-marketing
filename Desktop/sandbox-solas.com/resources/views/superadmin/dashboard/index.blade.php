@extends('template.app')

@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">
        {{-- Filter Wilayah --}}
        <div class="card mb-4">
            <div class="card-body py-2"> {{-- Mengurangi padding vertikal --}}
                <form method="GET" action="{{ route('dashboard-superadmin.index') }}"
                    class="row gy-2 gx-3 align-items-center">
                    <div class="col-md-auto">
                        <label class="form-label me-2" for="wilayah">Filter Cabang:</label>
                    </div>
                    <div class="col-md-4">
                        <select name="wilayah_id" id="wilayah" class="form-select form-select-sm select2"
                            onchange="this.form.submit()"> {{-- Ukuran select lebih kecil --}}
                            <option value="">-- Semua Cabang --</option>
                            @foreach ($allWilayah as $wilayah)
                                <option value="{{ $wilayah->id }}"
                                    {{ request('wilayah_id') == $wilayah->id ? 'selected' : '' }}>
                                    {{ $wilayah->wilayah }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </form>
            </div>
        </div>

        {{-- Kumpulan Kartu Statistik Ringkas --}}
        <div class="row g-4 mb-4">
            <div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <div class="avatar avatar-md mx-auto mb-2">
                            <span class="avatar-initial rounded bg-label-success"><i
                                    class="bx bxs-user-plus fs-4"></i></span>
                        </div>
                        <h4 class="mb-1">{{ $totalDokter }}</h4>
                        <p class="mb-0 small">Total Dokter</p>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <div class="avatar avatar-md mx-auto mb-2">
                            <span class="avatar-initial rounded bg-label-info"><i
                                    class='bx bx-bar-chart-alt-2 fs-4'></i></span> {{-- Ikon visit diganti --}}
                        </div>
                        <h4 class="mb-1">{{ $totalVisitToday }}</h4>
                        <p class="mb-0 small">Total Visit Hari Ini</p>
                    </div>
                </div>
            </div>

            @foreach ($statusVisitToday as $status => $total)
                @php
                    $cardColor = 'secondary';
                    $icon = 'bx-question-mark';
                    if (str_contains(strtolower($status), 'selesai')) {
                        $cardColor = 'success';
                        $icon = 'bx-check-circle';
                    } elseif (
                        str_contains(strtolower($status), 'pending') ||
                        str_contains(strtolower($status), 'dijadwalkan')
                    ) {
                        $cardColor = 'warning';
                        $icon = 'bx-time-five';
                    } elseif (
                        str_contains(strtolower($status), 'batal') ||
                        str_contains(strtolower($status), 'ditolak')
                    ) {
                        $cardColor = 'danger';
                        $icon = 'bx-x-circle';
                    }
                @endphp
                <div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <div class="avatar avatar-md mx-auto mb-2">
                                <span class="avatar-initial rounded bg-label-{{ $cardColor }}"><i
                                        class='bx {{ $icon }} fs-4'></i></span>
                            </div>
                            <h4 class="mb-1">{{ $total }}</h4>
                            <p class="mb-0 text-capitalize small">{{ $status }}</p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        {{-- Baris untuk Grafik --}}
        <div class="row g-4 mb-4">
            <div class="col-lg-7 col-12">
                <div class="card h-100"> {{-- Menambahkan h-100 jika ingin chart card sama tinggi jika bersebelahan dengan card lain di row yang sama --}}
                    <div class="card-header d-flex align-items-center justify-content-between pb-0"> {{-- Mengurangi padding bottom header --}}
                        <h5 class="card-title mb-0">Kunjungan Harian <span class="text-muted small">(7 Hari Terakhir)</span>
                        </h5>
                    </div>
                    <div class="card-body">
                        <canvas id="barChartVisit" height="280"></canvas> {{-- Sesuaikan tinggi canvas --}}
                    </div>
                </div>
            </div>

            <div class="col-lg-5 col-12">
                <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                        <h5 class="card-title mb-0">Distribusi Status Kunjungan <span class="text-muted small">(Hari
                                Ini)</span></h5>
                    </div>
                    <div class="card-body">
                        <canvas id="pieChartVisitStatus" height="280"></canvas> {{-- Sesuaikan tinggi canvas --}}
                    </div>
                </div>
            </div>
        </div>

        {{-- Tabel Pengajuan Pending --}}
        <div class="card">
            <div class="card-header">
                <h5 class="card-title m-0">Pengajuan Dokter Pending</h5>
            </div>
            <div class="table-responsive text-nowrap"> {{-- card-body tidak diperlukan jika hanya ada tabel --}}
                <table class="table table-striped table-hover"> {{-- Menghilangkan table-bordered untuk tampilan lebih bersih --}}
                    <thead>
                        <tr>
                            <th>Dokter</th>
                            <th>Cabang</th>
                            <th>No HP</th>
                            <th>Email</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody class="table-border-bottom-0"> {{-- Class dari template Sneat untuk menghilangkan border bawah tbody terakhir --}}
                        @forelse ($pengajuanPending as $pengajuan)
                            <tr onclick="window.location='{{ route('pengajuan-dokter.index') }}'" style="cursor: pointer;">
                                <td><strong>{{ $pengajuan->dokter }}</strong></td>
                                <td>{{ optional($pengajuan->wilayah)->wilayah ?? '-' }}</td>
                                <td>{{ $pengajuan->no_hp }}</td>
                                <td>{{ $pengajuan->email }}</td>
                                <td>
                                    <span class="badge rounded-pill bg-label-warning">{{ $pengajuan->status }}</span>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="text-center py-4">Tidak ada pengajuan pending.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        $(document).ready(function() {
            let dokterData = {}; // Objek untuk menyimpan data dokter
            $('.select2').select2({
                theme: 'bootstrap-5',
                allowClear: true
            });
        });
        document.addEventListener('DOMContentLoaded', function() {
            const legendColor = '#697a8d'; // Warna untuk legenda dan ticks (sesuaikan dengan tema Anda)
            const headingColor = '#566a7f'; // Warna untuk judul tooltip (sesuaikan)
            const gridBorderColor = 'rgba(72, 72, 100, 0.07)'; // Warna grid yang sangat samar

            // Bar Chart Kunjungan Harian
            const ctxBar = document.getElementById('barChartVisit');
            if (ctxBar) {
                const barChart = new Chart(ctxBar.getContext('2d'), {
                    type: 'bar',
                    data: {
                        labels: {!! json_encode($chartLabels) !!},
                        datasets: [{
                            label: 'Total Kunjungan',
                            data: {!! json_encode($chartData) !!},
                            backgroundColor: 'rgba(105, 108, 255, 0.8)', // Primary color from Sneat/Materio like themes
                            borderColor: 'transparent', // No border for bars
                            borderRadius: {
                                topLeft: 6,
                                topRight: 6
                            }, // Rounded top corners for bars
                            barThickness: 'flex',
                            maxBarThickness: 30
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        animation: {
                            duration: 500
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                grid: {
                                    color: gridBorderColor,
                                    drawBorder: false,
                                },
                                ticks: {
                                    color: legendColor,
                                    precision: 0,
                                    font: {
                                        size: 11
                                    }
                                }
                            },
                            x: {
                                grid: {
                                    display: false // Hilangkan grid x-axis
                                },
                                ticks: {
                                    color: legendColor,
                                    font: {
                                        size: 11
                                    }
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                display: false, // Biasanya tidak perlu jika hanya satu dataset
                            },
                            tooltip: {
                                backgroundColor: 'rgba(255, 255, 255, 0.95)',
                                titleColor: headingColor,
                                bodyColor: legendColor, // Warna body tooltip
                                borderColor: 'rgba(0,0,0,0.1)',
                                borderWidth: 1,
                                padding: 10,
                                cornerRadius: 6,
                                usePointStyle: true,
                            }
                        }
                    }
                });
            }

            // Pie Chart Status Visit Hari Ini
            const ctxPie = document.getElementById('pieChartVisitStatus');
            if (ctxPie) {
                const pieChartColorsData = [ // Warna dari tema Sneat/Materio
                    {
                        HSL: [221, 100, 70],
                        name: 'info'
                    }, // rgba(105, 108, 255, 1)
                    {
                        HSL: [142, 71, 45],
                        name: 'success'
                    }, // rgba(40, 199, 111, 1)
                    {
                        HSL: [40, 100, 50],
                        name: 'warning'
                    }, // rgba(255, 171, 0, 1)
                    {
                        HSL: [359, 79, 66],
                        name: 'danger'
                    }, // rgba(234, 84, 85, 1)
                    {
                        HSL: [210, 17, 75],
                        name: 'secondary'
                    } // rgba(168, 170, 174, 1)
                ];

                let backgroundColors = [];
                let borderColors = [];
                let numStatuses = {{ count($statusVisitToday) }};

                for (let i = 0; i < numStatuses; i++) {
                    let colorIndex = i % pieChartColorsData.length;
                    let hsl = pieChartColorsData[colorIndex].HSL;
                    backgroundColors.push(`hsla(${hsl[0]}, ${hsl[1]}%, ${hsl[2]}%, 0.8)`);
                    borderColors.push(`hsla(${hsl[0]}, ${hsl[1]}%, ${hsl[2]}%, 1)`);
                }

                const pieChart = new Chart(ctxPie.getContext('2d'), {
                    type: 'pie', // Bisa juga 'doughnut'
                    data: {
                        labels: {!! json_encode(array_keys($statusVisitToday->toArray())) !!},
                        datasets: [{
                            label: 'Jumlah',
                            data: {!! json_encode(array_values($statusVisitToday->toArray())) !!},
                            backgroundColor: backgroundColors,
                            borderColor: borderColors, // Bisa juga 'transparent' atau warna card background
                            borderWidth: 1.5
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        animation: {
                            duration: 500
                        },
                        plugins: {
                            legend: {
                                position: 'bottom',
                                labels: {
                                    color: legendColor,
                                    padding: 15,
                                    font: {
                                        size: 11
                                    },
                                    usePointStyle: true
                                }
                            },
                            tooltip: {
                                backgroundColor: 'rgba(255, 255, 255, 0.95)',
                                titleColor: headingColor,
                                bodyColor: legendColor,
                                borderColor: 'rgba(0,0,0,0.1)',
                                borderWidth: 1,
                                padding: 10,
                                cornerRadius: 6,
                                usePointStyle: true,
                            }
                        }
                    }
                });
            }
        });
    </script>
@endpush
