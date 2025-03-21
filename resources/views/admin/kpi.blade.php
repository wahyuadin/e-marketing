@extends('template.app')

@section('content')
<div class="container-xxl flex-grow-1 container-p-y">
  <div class="row">

    <!-- KEY PERFOMANCE INDICATOR -->
    <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4 order-1 mb-4">
      <div class="card h-100">
        <div class="card-header d-flex align-items-center justify-content-between pb-0">
            <div class="card-title mb-0">
                <h5 class="m-0 me-2">Key Performance Indicator</h5>
            </div>
        </div>
        <div class="card-body">
            <div class="row g-3 mt-1">
                <div class="col-12 col-sm-12 col-md-6">
                    <div class="card shadow-sm h-100">
                        <div class="card-body text-center">
                            <div class="avatar mx-auto mb-3" style="width: 80px; height: 80px;">
                                <img src="../assets/img/avatars/1.png"
                                     alt="profile picture"
                                     class="rounded-circle w-100 h-100" />
                            </div>
                            <h5 class="mb-2">WAHYU</h5>
                            <div class="d-flex align-items-center justify-content-center">
                                <span class="badge badge-sm bg-warning rounded-pill d-flex align-items-center">
                                    <i class="bx bxs-star text-white"></i>
                                    <span class="mt-0" style="margin-left: 5px">5.0</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-12 col-md-6">
                    <div class="card shadow-sm h-100">
                        <div class="card-body text-center">
                            <div class="avatar mx-auto mb-3" style="width: 80px; height: 80px;">
                                <img src="../assets/img/avatars/1.png"
                                     alt="profile picture"
                                     class="rounded-circle w-100 h-100" />
                            </div>
                            <h5 class="mb-2">WAHYU</h5>
                            <div class="d-flex align-items-center justify-content-center">
                                <span class="badge badge-sm bg-warning rounded-pill d-flex align-items-center">
                                    <i class="bx bxs-star text-white"></i>
                                    <span class="mt-0" style="margin-left: 5px">5.0</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-12 col-md-6">
                    <div class="card shadow-sm h-100">
                        <div class="card-body text-center">
                            <div class="avatar mx-auto mb-3" style="width: 80px; height: 80px;">
                                <img src="../assets/img/avatars/1.png"
                                     alt="profile picture"
                                     class="rounded-circle w-100 h-100" />
                            </div>
                            <h5 class="mb-2">WAHYU</h5>
                            <div class="d-flex align-items-center justify-content-center">
                                <span class="badge badge-sm bg-warning rounded-pill d-flex align-items-center">
                                    <i class="bx bxs-star text-white"></i>
                                    <span class="mt-0" style="margin-left: 5px">5.0</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-12 col-md-6">
                    <div class="card shadow-sm h-100">
                        <div class="card-body text-center">
                            <div class="avatar mx-auto mb-3" style="width: 80px; height: 80px;">
                                <img src="../assets/img/avatars/1.png"
                                     alt="profile picture"
                                     class="rounded-circle w-100 h-100" />
                            </div>
                            <h5 class="mb-2">WAHYU</h5>
                            <div class="d-flex align-items-center justify-content-center">
                                <span class="badge badge-sm bg-warning rounded-pill d-flex align-items-center">
                                    <i class="bx bxs-star text-white"></i>
                                    <span class="mt-0" style="margin-left: 5px">5.0</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>

    <!-- Avg.result Area Scores -->
    <div class="col-12 col-lg-8 order-0 order-md-3 order-lg-2 mb-4">
      <div class="card">
        <div class="row row-bordered g-0">
          <div class="col-12 col-sm-12 col-md-8">
            <h5 class="card-header m-0 me-2 pb-3">Avg.result Area Scores</h5>
            <div class="card-body">
                <canvas id="totalrevenuechart"></canvas>
            </div>

            <hr>
            <h5 class="card-title mb-3 text-center">Marketing Team</h5>
            <div class="d-flex align-items-center justify-content-center mb-3">
                <span class="badge bg-primary rounded-pill d-flex align-items-center">
                    <i class="bx bxs-star text-white"></i>
                    <span class="ms-2">Rating</span>
                </span>
            </div>

            <div class="d-flex justify-content-center gap-3">
                <div class="card bg-success text-white" style="width: 80px;">
                    <div class="card-body p-2">
                        <h5 class="card-title text-white mb-0 text-center">Baik</h5>
                        <div class="d-flex align-items-center justify-content-center">
                            <i class="bx bxs-star text-warning"></i>
                            <span class="ms-1">9.4</span>
                        </div>
                    </div>
                </div>
                <div class="card bg-secondary text-white" style="width: 80px;">
                    <div class="card-body p-2">
                        <h5 class="card-title text-white mb-0 text-center">Baik</h5>
                        <div class="d-flex align-items-center justify-content-center">
                            <i class="bx bxs-star text-warning"></i>
                            <span class="ms-1">9.4</span>
                        </div>
                    </div>
                </div>
                <div class="card bg-danger text-white" style="width: 80px;">
                    <div class="card-body p-2">
                        <h5 class="card-title text-white mb-0 text-center">Baik</h5>
                        <div class="d-flex align-items-center justify-content-center">
                            <i class="bx bxs-star text-warning"></i>
                            <span class="ms-1">9.4</span>
                        </div>
                    </div>
                </div>
            </div>
          </div>

          <div class="col-12 col-sm-12 col-md-4">
            <div class="text-center pt-3">
              <div class="d-flex px-3 mb-4">
                <p class="mb-0 fw-bold">Avg Score Range:</p>
              </div>
              <div class="table-responsive px-3 mb-2">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>Range</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1-40</td>
                      <td><span class="badge bg-danger">Bad</span></td>
                    </tr>
                    <tr>
                      <td>41-79</td>
                      <td><span class="badge bg-warning">Mid</span></td>
                    </tr>
                    <tr>
                      <td>80-100</td>
                      <td><span class="badge bg-success">Good</span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <hr>
              <div class="px-3">
                <p class="mb-2 fw-bold">Result Areas</p>
                <div class="table-responsive mb-4">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Area</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Email Marketing</td>
                        <td><span class="badge bg-warning">Mid</span></td>
                      </tr>
                      <tr>
                        <td>Brand Awareness</td>
                        <td><span class="badge bg-success">Good</span></td>
                      </tr>
                      <tr>
                        <td>Customer Satisfaction</td>
                        <td><span class="badge bg-danger">Bad</span></td>
                      </tr>
                      <tr>
                        <td>Sales Growth</td>
                        <td><span class="badge bg-warning">Mid</span></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/ Total Revenue -->

  </div>
</div>
@endsection


@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('totalrevenuechart');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Januari', 'Februari', 'Maret', 'April', 'Mei'],
            datasets: [{
                label: 'Score',
                data: [120, 150, 180, 200, 170],
                backgroundColor: 'rgba(75, 192, 192, 0.8)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1,
                borderRadius: 10,
                barThickness: 25,
                maxBarThickness: 30
            }]
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
                            size: 14
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        font: {
                            size: 14
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
                            size: 14
                        },
                        usePointStyle: true
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(255, 255, 255, 0.95)',
                    titleColor: '#333',
                    bodyColor: '#555',
                    borderColor: 'rgba(0, 0, 0, 0.1)',
                    borderWidth: 1,
                    padding: 15,
                    cornerRadius: 10,
                    displayColors: false
                }
            }
        }
    });
</script>
@endpush
