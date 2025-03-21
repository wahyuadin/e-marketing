@extends('template.app')

@section('content')
<!-- Content -->
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="row">
        <!-- ACHV SALES PER RSM -->
        <div class="col-12 col-lg-7 order-1 order-md-3 order-lg-2 mb-4">
            <div class="card h-100">
                <div class="row row-bordered g-0">
                    <div class="col-md-12">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="card-title m-0 me-2">ACHV SALES PER RSM</h5>
                        </div>
                        <div class="card-body">
                            <canvas id="arcrsm"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ ACHV REKAPITULASI SALES NASIONAL -->
        <div class="col-12 col-lg-5 order-1 order-md-3 order-lg-2 mb-4">
            <div class="card h-100">
                <div class="row row-bordered g-0">
                    <div class="col-md-12">
                        <div class="card-header d-flex align-items-center">
                            <h5 class="card-title m-0 me-2">REKAPITULASI SALES NASIONAL</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive p-2">
                                <table id="example" class="table table-striped table-bordered w-100 mt-3">
                                    <thead>
                                        <tr>
                                            <th scope="col">RANK</th>
                                            <th scope="col">REGION</th>
                                            <th scope="col">SALES</th>
                                            <th scope="col">TARGET</th>
                                            <th scope="col">% ACH</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                            $no = 1;
                                        @endphp
                                        @foreach($rekapitulasiSalesNasional as $salesHarians)
                                            <tr>
                                                <td class="clickable-cell"
                                                    data-detail='@json($salesHarians->detail)'
                                                    data-regional="{{ $salesHarians->nama_regional }}">{{ $no++ }}</td>
                                                <td class="clickable-cell"
                                                    data-detail='@json($salesHarians->detail)'
                                                    data-regional="{{ $salesHarians->nama_regional }}">{{ $salesHarians->nama_regional }}</td>
                                                <td class="clickable-cell"
                                                    data-detail='@json($salesHarians->detail)'
                                                    data-regional="{{ $salesHarians->nama_regional }}">Rp {{ number_format($salesHarians->total_penjualan, 0, ',', '.') }}</td>
                                                <td class="clickable-cell"
                                                    data-detail='@json($salesHarians->detail)'
                                                    data-regional="{{ $salesHarians->nama_regional }}">Rp {{ number_format($salesHarians->total_target, 0, ',', '.') }}</td>
                                                <td class="clickable-cell"
                                                    data-detail='@json($salesHarians->detail)'
                                                    data-regional="{{ $salesHarians->nama_regional }}">{{ $salesHarians->achievement }}%</td>
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
        {{-- end --}}
        <!-- SALES HARIAN PER - REGIONAL -->
        <div class="col-12 col-lg-12 order-md-3 order-2 order-lg-2 mb-4">
            <div class="card">
            <div class="row row-bordered g-0">
                <div class="col-md-12">
                    <h5 class="card-header m-0 me-2 pb-3">SALES HARIAN PER - REGIONAL</h5>
                        <div class="text-start ms-3 mb-3">
                            <input type="date" class="form-control d-inline-block" style="width: auto;" value="{{ $tanggal ?? date('Y-m-d') }}" aria-label="Tanggal" name="tanggal" onchange="window.location.href='{{ url('sales/dashboard') }}/' + this.value">
                            @if($rekapitulasiSalesNasional->count() > 0)
                                <a href="{{ route('sales.dashboard.export', $tanggal ?? date('Y-m-d')) }}" target="_blank" class="btn btn-info"><i class='bx bx-export'></i></a>
                            @endif
                        </div>
                    <div class="table-responsive p-2">
                        <table class="table table-striped table-bordered w-100 mt-3">
                            <thead>
                                <tr>
                                    <th scope="col">RANK</th>
                                    <th scope="col">REGION</th>
                                    <th scope="col">SALES</th>
                                    <th scope="col">TARGET</th>
                                    <th scope="col">% ACH</th>
                                </tr>
                                @foreach($rank['topBottomRegions'] as $getRankingUpDowns)
                                    <tr>
                                        <td>
                                            @if($getRankingUpDowns['Ranking'] < 4)
                                                <b>{{ $getRankingUpDowns['Ranking'] }}</b>
                                            @else
                                                {{ $getRankingUpDowns['Ranking'] }}
                                            @endif
                                        </td>
                                        <td>{{ $getRankingUpDowns['Region'] }}</td>
                                        <td>{{ $getRankingUpDowns['Sales'] }}</td>
                                        <td>{{ $getRankingUpDowns['Target'] }}</td>
                                        <td>{{ $getRankingUpDowns['Achievement'] }}</td>
                                    </tr>
                                @endforeach
                                <tr>
                                    <td colspan="6" style="background-color: #fa2424; color: white;" class="text-center"><b>TOTAL NASIONAL</b></td>
                                </tr>
                                <tr style="background-color: rgb(8, 8, 70)">
                                    <td colspan="2" class="text-center" style="color: white"><b>SALES</b></td>
                                    <td colspan="2" class="text-center" style="color: white"><b>TARGET</b></td>
                                    <td colspan="2" class="text-center" style="color: white"><b>% ACH</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-center">
                                        <b>Rp {{ number_format($rank['totalPenjualan'], 0, ',', '.') }}</b>
                                    </td>
                                    <td colspan="2" class="text-center">
                                        <b>Rp {{ number_format($rank['totalTarget'], 0, ',', '.') }}</b>
                                    </td>
                                    <td colspan="2" class="text-center">
                                        <b>{{ $rank['totalAchievement'] }}%</b>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            </div>
        </div>
        {{-- end tes --}}
    </div>
  </div>
  <!-- / Content -->
@component('components.modal', [
    'modal_id' => 'detailModal',
    'modal_label' => 'Detail Regional',
    'body' => 'admin.partial.sales.dashboard.detail',
])
@endcomponent

@endsection
@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script><script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>
<script>
    const ctx = document.getElementById('arcrsm');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: {!! json_encode($rekapitulasiSalesNasional->pluck('labels')) !!},
            datasets: [{
                label: 'Penjualan',
                data: {!! json_encode($rekapitulasiSalesNasional->pluck('total_penjualan')) !!},
                backgroundColor: 'rgba(54, 162, 235, 0.8)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1,
                borderRadius: 8,
                barThickness: 20,
                maxBarThickness: 25
            },
            {
                label: 'Target',
                data: {!! json_encode($rekapitulasiSalesNasional->pluck('total_target')) !!},
                backgroundColor: 'rgba(255, 99, 132, 0.8)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1,
                borderRadius: 8,
                barThickness: 20,
                maxBarThickness: 25
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
                        },
                        autoSkip: false,
                        padding: 10
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
    $(document).ready(function() {
        $('.clickable-cell').click(function() {
            var detail = $(this).data('detail');
            var regionalName = $(this).data('regional');

            $('#regionalName').text(regionalName);
            var detailContent = '';

            detail.forEach(function(item) {
                detailContent += `
                    <tr>
                        <td>${item.nama_sales}</td>
                        <td>Rp ${new Intl.NumberFormat('id-ID').format(item.penjualan)}</td>
                        <td>Rp ${new Intl.NumberFormat('id-ID').format(item.target)}</td>
                        <td>${item.achievement}%</td>
                    </tr>
                `;
            });

            $('#detailContent').html(detailContent);
            $('#detailModal').modal('show');
        });
    });
    $(document).ready(function() {
        $('#example').DataTable({
            pageLength: 1,
            lengthMenu: [1, 2, 5, 10, 25, 50, 75, 100],
        });
    });
</script>
@endpush
