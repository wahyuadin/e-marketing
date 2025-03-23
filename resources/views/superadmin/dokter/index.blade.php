@extends('template.app')
@section('content')
    <!-- Start of Selection -->
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Data Dokter</h5>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData"><i
                                class='bx bx-plus'></i></button>
                    </div>
                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        @include('alert')
                        <thead>
                            <tr>
                                <th style="width : 5%">No</th>
                                <th>Nama Dokter</th>
                                <th>Email</th>
                                <th>Instansi</th>
                                <th>Instagram</th>
                                <th>Wilayah</th>
                                <th>Spesialis</th>
                                <th>Alamat Rumah</th>
                                <th>Alamat Praktek</th>
                                <th>No Telp</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $datas->dokter ?? '-' }}</td>
                                    <td>{{ $datas->email ?? '-' }}</td>
                                    <td>{{ $datas->instansi->instansi ?? '-' }}</td>
                                    <td>{{ $datas->instagram ?? '-' }}</td>
                                    <td>{{ $datas->wilayah->wilayah ?? '-' }}</td>
                                    <td>{{ $datas->spesialis->spesialis ?? '-' }}</td>
                                    <td>{{ \Illuminate\Support\Str::limit($datas->alamat_rumah ?? '-', 50) }}</td>
                                    <td>{{ \Illuminate\Support\Str::limit($datas->alamat_praktek ?? '-', 50) }}</td>
                                    <td>{{ $datas->no_hp ?? '-' }}</td>
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
    @include('superadmin.dokter.add')
    @include('superadmin.dokter.detail')
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
