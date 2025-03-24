@extends('template.app')
@section('content')
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
                                class='bx bx-plus'></i></button>
                    </div>
                    <h5>{{ Auth::user()->nip }} - {{ Auth::user()->nama }} [{{ Auth::user()->role }}]</h5>
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
                                <th>Google Maps</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                @php
                                    $isLate =
                                        strtotime($datas->waktu) > strtotime('08:00:00') &&
                                        trim($datas->status) == 'dalam_kota' &&
                                        trim($datas->keterangan ?? '') == 'pagi';
                                @endphp

                                <tr style="background-color: {{ $isLate ? 'rgba(255, 0, 0, 0.600)' : '' }}">
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">{{ $index + 1 }}</td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">{{ $datas->user->nama ?? '-' }}
                                    </td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">{{ $datas->user->role ?? '-' }}
                                    </td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">{{ $datas->tanggal ?? '-' }}
                                    </td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">
                                        <b>{{ $datas->waktu ? $datas->waktu . ' WIB' : '-' }}</b>
                                    </td>
                                    <td style="color: {{ $isLate ? 'white' : 'inherit' }};">
                                        {{ $datas->keterangan ?? '-' }}</td>
                                    <td>
                                        <span
                                            class="badge {{ $datas->status == 'akamtri' ? 'bg-success' : ($datas->status == 'dalam_kota' ? 'bg-warning' : 'bg-success') }}">
                                            {{ ucfirst($datas->status) }}
                                        </span>
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

                                        <!-- Tombol Detail -->
                                        <button data-bs-toggle="modal" data-bs-target="#detailData{{ $datas->id }}"
                                            class="btn btn-info btn-sm bx bx-detail">
                                        </button>

                                        <!-- Tombol Hapus -->
                                        <a href="{{ route('dokter.destroy', $datas->id) }}"
                                            class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"
                                            title="Hapus">
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @include('superadmin.absensi.add')
    {{-- @include('superadmin.dokter.detail') --}}
    @push('style')
        {{-- datatable --}}
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
    @endpush

    @push('scripts')
        {{-- Datatable --}}
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>
        <script>
            new DataTable('#example');
        </script>
    @endpush
@endsection
