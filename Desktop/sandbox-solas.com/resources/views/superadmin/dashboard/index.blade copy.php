@extends('template.app')

@section('content')
<!-- Content -->
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="row">
        <!-- Sales Data Earn -->
        <div class="col-lg-12 col-md-4 order-0">
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                    <div class="card h-100">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex align-items-center mb-3">
                                <div class="avatar flex-shrink-0 me-3">
                                    <span class="avatar-initial rounded bg-label-primary">
                                        <i class="bx bx-dollar"></i>
                                    </span>
                                </div>
                                <span class="fw-semibold">Sales</span>
                            </div>
                            <h3 class="card-title mb-2">$12,628</h3>
                            <div class="d-flex align-items-center mt-auto">
                                <i class="bx bx-up-arrow-alt text-success me-1"></i>
                                <small class="text-success fw-semibold">+72.80%</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                    <div class="card h-100">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex align-items-center mb-3">
                                <div class="avatar flex-shrink-0 me-3">
                                    <span class="avatar-initial rounded bg-label-info">
                                        <i class="bx bx-data"></i>
                                    </span>
                                </div>
                                <span class="fw-semibold">Data</span>
                            </div>
                            <h3 class="card-title text-nowrap mb-2">$4,679</h3>
                            <div class="d-flex align-items-center mt-auto">
                                <i class="bx bx-up-arrow-alt text-success me-1"></i>
                                <small class="text-success fw-semibold">+28.42%</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-4 col-lg-6 mb-4">
                    <div class="card h-100">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex align-items-center mb-3">
                                <div class="avatar flex-shrink-0 me-3">
                                    <span class="avatar-initial rounded bg-label-success">
                                        <i class="bx bx-wallet"></i>
                                    </span>
                                </div>
                                <span class="fw-semibold">Earn</span>
                            </div>
                            <h3 class="card-title text-nowrap mb-2">$4,679</h3>
                            <div class="d-flex align-items-center mt-auto">
                                <i class="bx bx-up-arrow-alt text-success me-1"></i>
                                <small class="text-success fw-semibold">+28.42%</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Weekly Activity -->
        <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
            <div class="card h-100">
                <div class="row row-bordered g-0">
                    <div class="col-md-12">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="card-title m-0 me-2">Weekly Activity</h5>
                            <div class="dropdown ms-auto">
                                <button class="btn p-0" type="button" data-bs-toggle="dropdown">
                                    <i class="bx bx-dots-vertical-rounded"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="javascript:void(0);">Last 7 days</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Last 30 days</a>
                                    <a class="dropdown-item" href="javascript:void(0);">Last 3 months</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="totalRevenueChart" style="min-height: 300px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ Expense Statistics -->
        <div class="col-12 col-sm-12 col-md-8 col-lg-4 order-3 order-md-2">
            <div class="row">
                <div class="col-12 col-sm-12 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="card-title m-0">Expense Statistics</h5>
                            </div>
                            <div class="chart-container" style="position: relative; height: calc(100% - 50px); min-height: 300px;">
                                <canvas id="expenseStatisticsChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- Balance History -->
        <div class="col-lg-6 col-md-4 order-0">
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between pb-0">
                    <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Balance History</h5>
                    </div>
                </div>
                <div class="card-body">
                    <div class="chart-container" style="position: relative; height: 220px;">
                        <canvas id="BalanceHistory"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <!--/ Balance History -->

        <!-- Monthly Revenue -->
        <div class="col-lg-6 col-md-4 order-0">
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between pb-0">
                    <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Monthly Revenue</h5>
                    </div>
                </div>
                <div class="card-body">
                    <div class="chart-container" style="position: relative; height: 220px;">
                        <canvas id="monthlyRevenue"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <!--/ Monthly Revenue -->
    </div>
</div>
<!-- / Content -->
@endsection

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Inisialisasi chart untuk Total Revenue
    const ctx = document.getElementById('totalRevenueChart');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab'],
            datasets: [{
                    label: 'Deposit',
                    data: [65, 59, 80, 81, 56, 55],
                    backgroundColor: 'rgba(54, 162, 235, 0.8)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                    borderRadius: 8,
                    barThickness: 20,
                    maxBarThickness: 25
                },
                {
                    label: 'Withdraw',
                    data: [40, 45, 35, 50, 45, 35],
                    backgroundColor: 'rgba(255, 99, 132, 0.8)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
                    borderRadius: 8,
                    barThickness: 20,
                    maxBarThickness: 25
                }
            ]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)',
                        drawBorder: false
                    },
                    ticks: {
                        font: {
                            size: 12
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    },
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
                        padding: 20,
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

    // Inisialisasi chart untuk Expense Statistics
    const expenseCtx = document.getElementById('expenseStatisticsChart');
    new Chart(expenseCtx, {
        type: 'pie',
        data: {
            labels: ['Entertainment', 'Investment', 'Bill Expense', 'Others'],
            datasets: [{
                label: 'Expense',
                data: [65, 59, 80, 81],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(255, 205, 86, 0.8)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 99, 132, 1)',
                    'rgba(255, 205, 86, 1)'
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
                        padding: 20,
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

    // Inisialisasi chart untuk Balance History
    const balanceHistoryCtx = document.getElementById('BalanceHistory');
    new Chart(balanceHistoryCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des'],
            datasets: [{
                label: 'Balance History',
                data: [65, 59, 80, 81, 56, 55, 40, 65, 59, 80, 81, 56],
                fill: {
                    target: 'origin',
                    above: 'rgba(99, 102, 241, 0.1)' // Indigo yang lembut
                },
                borderColor: 'rgb(99, 102, 241)', // Indigo solid
                borderWidth: 2,
                tension: 0.4,
                pointRadius: 4,
                pointBackgroundColor: 'rgb(99, 102, 241)',
                pointBorderColor: '#fff',
                pointHoverRadius: 6,
                pointHoverBackgroundColor: '#fff',
                pointHoverBorderColor: 'rgb(99, 102, 241)',
                pointHoverBorderWidth: 2
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        padding: 20,
                        font: {
                            size: 12,
                            weight: '500'
                        },
                        usePointStyle: true
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(255, 255, 255, 0.95)',
                    titleColor: '#1F2937', // Gray-800 yang elegan
                    titleFont: {
                        size: 14,
                        weight: '600'
                    },
                    bodyColor: '#4B5563', // Gray-600 untuk keterbacaan
                    bodyFont: {
                        size: 12
                    },
                    borderColor: 'rgba(229, 231, 235, 1)', // Gray-200 untuk border halus
                    borderWidth: 1,
                    padding: 12,
                    cornerRadius: 8,
                    displayColors: false,
                    callbacks: {
                        label: function(context) {
                            return `Balance: $${context.raw}`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(243, 244, 246, 1)', // Gray-100 untuk grid yang subtle
                        drawBorder: false
                    },
                    ticks: {
                        font: {
                            size: 11
                        },
                        color: '#6B7280' // Gray-500 untuk label
                    }
                },
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        font: {
                            size: 11
                        },
                        color: '#6B7280' // Gray-500 untuk label
                    }
                }
            }
        }
    });

    // Inisialisasi chart untuk Monthly Revenue
    const monthlyRevenueCtx = document.getElementById('monthlyRevenue');
    new Chart(monthlyRevenueCtx, {
        type: 'line',
        data: {
            labels: ['2019', '2020', '2021', '2022', '2023'],
            datasets: [{
                label: 'Pendapatan Bulanan',
                data: [45000, 52000, 48000, 58000, 63000],
                backgroundColor: 'rgba(79, 70, 229, 0.1)', // Indigo yang lembut
                borderColor: 'rgb(79, 70, 229)', // Indigo solid
                borderWidth: 2,
                tension: 0.4,
                fill: true
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        font: {
                            size: 12
                        }
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(255, 255, 255, 0.95)',
                    titleColor: '#1F2937',
                    titleFont: {
                        size: 14,
                        weight: '600'
                    },
                    bodyColor: '#4B5563',
                    bodyFont: {
                        size: 12
                    },
                    borderColor: 'rgba(229, 231, 235, 1)',
                    borderWidth: 1,
                    padding: 12,
                    cornerRadius: 8,
                    callbacks: {
                        label: function(context) {
                            return `Pendapatan: $${context.raw}`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(243, 244, 246, 1)',
                        drawBorder: false
                    },
                    ticks: {
                        font: {
                            size: 11
                        },
                        color: '#6B7280'
                    }
                },
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        font: {
                            size: 11
                        },
                        color: '#6B7280'
                    }
                }
            }
        }
    });
</script>
@endpush