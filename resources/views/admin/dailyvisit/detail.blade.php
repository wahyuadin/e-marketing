@extends('template.app')
@section('content')
    <div class="content-wrapper">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="card w-100">
                <div class="card-body">
                    <div class="row">
                        <div class="col-6 col-md-8">
                            <h5 class="card-title">DETAIL FORM DATA DAILY VISIT</h5>
                        </div>
                    </div>
                    <div class="row g-6">
                        <div class="col-xl-12 mt-3">
                            <div class="nav-align-top nav-tabs-shadow">
                                <ul class="nav nav-tabs nav-fill" role="tablist">
                                    <li class="nav-item">
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"
                                            data-bs-target="#ringkasan" aria-controls="ringkasan" aria-selected="false">
                                            <span class="d-none d-sm-inline-flex align-items-center">
                                                <i class="icon-base bx bx-detail icon-sm me-1_5"></i>Ringkasan</span>
                                            <i class="icon-base bx bx-detail icon-sm d-sm-none"></i>
                                        </button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                                            data-bs-target="#data" aria-controls="data" aria-selected="true">
                                            <span class="d-none d-sm-inline-flex align-items-center">
                                                <i class="icon-base bx bx-data icon-sm me-1_5"></i>Data
                                            </span>
                                            <i class="icon-base bx bx-data icon-sm d-sm-none"></i>
                                        </button>
                                    </li>
                                    {{-- <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                                            data-bs-target="#navs-justified-messages"
                                            aria-controls="navs-justified-messages" aria-selected="false">
                                            <span class="d-none d-sm-inline-flex align-items-center"><i
                                                    class="icon-base bx bx-message-square icon-sm me-1_5"></i>Messages</span>
                                            <i class="icon-base bx bx-message-square icon-sm d-sm-none"></i>
                                        </button>
                                    </li> --}}
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade" id="data" role="tabpanel">
                                        <div class="table-responsive mt-3">
                                            <div class="mt-3 mb-4">
                                                <a target="_blank" href="{{ route('dailyvisit.excel', $data->id) }}"
                                                    class="btn btn-warning">
                                                    <i class="bi bi-file-earmark-spreadsheet"></i>
                                                </a>
                                                <a target="_blank" href="{{ route('form.show', $data->id) }}"
                                                    class="btn btn-info">
                                                    <i class="bi bi-eye"></i>
                                                </a>
                                            </div>
                                            <table id="example" class="table table-striped table-bordered w-100 mt-3">
                                                @include('alert')
                                                <thead>
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Tanggal / Waktu</th>
                                                        <th>Regional</th>
                                                        <th>Cabang</th>
                                                        <th>Karyawan</th>
                                                        <th>Jabatan</th>
                                                        <th>Instansi</th>
                                                        <th>Dokter</th>
                                                        <th>Spesialis</th>
                                                        <th>Keperluan</th>
                                                        <th>Jenis Kunjungan</th>
                                                        <th>Keterangan (Foto Marki)</th>
                                                        <th>Google Maps</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($data->dailyvisitdetail as $datas)
                                                        <tr>
                                                            <td>{{ $loop->iteration }}</td>
                                                            <td>{{ $datas->created_at ?? '-' }}</td>
                                                            <td>
                                                                {{ $datas->karyawan?->cabangDetail?->first()?->cabang?->regionalDetail->first()?->regional?->nama_regional ?? '-' }}
                                                            </td>
                                                            <td>
                                                                {{ $datas->karyawan->cabangDetail->first()->cabang->cabang ?? '-' }}
                                                            </td>
                                                            <td>{{ $datas->karyawan->nama_karyawan ?? '-' }}</td>
                                                            <td>{{ $datas->karyawan->jabatan->jabatan ?? '-' }}</td>
                                                            <td>{{ $datas->instansi->instansi ?? '-' }}</td>
                                                            <td>{{ $datas->dokter->dokter ?? '-' }}</td>
                                                            <td>{{ $datas->dokter->spesialis->spesialis ?? '-' }}</td>
                                                            <td>{{ $datas->keperluan ?? '-' }}</td>
                                                            <td>{{ $datas->jenis_kunjungan ?? '-' }}</td>
                                                            <td>
                                                                <a target="_blank"
                                                                    href="{{ asset('assets/absensi/' . $datas->keterangan) }}">
                                                                    <img src="{{ asset('assets/absensi/' . $datas->keterangan) }}"
                                                                        alt="{{ $datas->keterangan }}"
                                                                        style="width: 100%; height: auto; max-width: 200px;">
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <a href="https://www.google.com/maps?q={{ $datas->latitude }},{{ $datas->longitude }}"
                                                                    class="btn btn-secondary btn-xs rounded"
                                                                    target="_blank">
                                                                    <i class="bx bx-map"></i> Google Maps</a>
                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade show active" id="ringkasan" role="tabpanel">
                                        <div class="container-xxl flex-grow-1 container-p-y">
                                            <div class="row">
                                                <!-- Chart Kunjungan Harian -->
                                                <div class="col-md-8 col-xxl-8 mb-4">
                                                    <div class="card h-100">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Kunjungan Harian</h5>
                                                            <canvas id="dailyVisitChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Chart Dokter per Spesialisasi -->
                                                <div class="col-md-4 col-xxl-4 mb-4">
                                                    <div class="card h-100">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Dokter per Spesialisasi</h5>
                                                            <canvas id="doctorSpecialtyChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Chart Karyawan per Jabatan -->
                                                <div class="col-md-6 col-xxl-6 mb-4">
                                                    <div class="card h-100">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Karyawan per Jabatan</h5>
                                                            <canvas id="employeePositionChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Chart Kunjungan per Instansi -->
                                                <div class="col-md-6 col-xxl-6 mb-4">
                                                    <div class="card h-100">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Kunjungan per Instansi</h5>
                                                            <canvas id="institutionVisitChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="navs-justified-messages" role="tabpanel">
                                        <p>Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans
                                            macaroon gummies
                                            cupcake
                                            gummi bears cake chocolate.</p>
                                        <p class="mb-0">Cake chocolate bar cotton candy apple pie tootsie roll ice
                                            cream apple
                                            pie
                                            brownie
                                            cake. Sweet roll icing sesame snaps caramels danish toffee. Brownie biscuit
                                            dessert
                                            dessert.
                                            Pudding jelly jelly-o tart brownie jelly.</p>
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    @endpush

    @push('scripts')
        {{-- Datatable --}}
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>
        <script>
            new DataTable('#example');
            async function fetchData() {
                const data = @json($data->dailyvisitdetail);

                let dailyVisitData = {};
                let doctorSpecialtyData = {};
                let employeePositionData = {};
                let institutionVisitData = {};
                let branchVisitData = {};

                data.forEach(item => {
                    // Kunjungan Harian
                    const date = new Date(item.created_at).toLocaleDateString();
                    dailyVisitData[date] = (dailyVisitData[date] || 0) + 1;

                    // Spesialis Dokter
                    const specialty = item.dokter?.spesialis?.spesialis || "Tidak Diketahui";
                    doctorSpecialtyData[specialty] = (doctorSpecialtyData[specialty] || 0) + 1;

                    // Jabatan Karyawan
                    const position = item.karyawan?.jabatan?.jabatan || "Tidak Diketahui";
                    employeePositionData[position] = (employeePositionData[position] || 0) + 1;

                    // Kunjungan per Instansi
                    const institution = item.instansi?.instansi || "Tidak Diketahui";
                    institutionVisitData[institution] = (institutionVisitData[institution] || 0) + 1;

                    // Kunjungan per Cabang
                    item.karyawan?.cabangDetail?.forEach(cabangDetail => {
                        const branch = cabangDetail.cabang?.cabang || "Tidak Diketahui";
                        branchVisitData[branch] = (branchVisitData[branch] || 0) + 1;
                    });
                });

                // Render Charts
                renderChart("dailyVisitChart", "Kunjungan Harian", Object.keys(dailyVisitData), Object.values(
                    dailyVisitData), "line");
                renderChart("doctorSpecialtyChart", "Dokter per Spesialisasi", Object.keys(doctorSpecialtyData), Object
                    .values(doctorSpecialtyData), "pie");
                renderChart("employeePositionChart", "Jabatan", Object.keys(employeePositionData), Object
                    .values(employeePositionData), "bar");
                renderChart("institutionVisitChart", "Kunjungan per Instansi", Object.keys(institutionVisitData), Object
                    .values(institutionVisitData), "bar");
                renderChart("branchVisitChart", "Kunjungan per Cabang", Object.keys(branchVisitData), Object.values(
                    branchVisitData), "line");
            }

            function renderChart(canvasId, label, labels, data, type) {
                const ctx = document.getElementById(canvasId).getContext("2d");
                new Chart(ctx, {
                    type: type,
                    data: {
                        labels: labels,
                        datasets: [{
                            label: label,
                            data: data,
                            backgroundColor: ["#ff6384", "#36a2eb", "#ffce56", "#4bc0c0", "#9966ff"],
                            borderColor: "#333",
                            borderWidth: 1
                        }]
                    }
                });
            }

            fetchData();
        </script>
    @endpush
@endsection
