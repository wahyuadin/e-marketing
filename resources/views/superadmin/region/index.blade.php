@extends('template.app')
@section('content')
    <!-- Start of Selection -->
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Data Regional</h5>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData">
                            <i class='bx bx-plus'></i>
                        </button>
                        <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exportExcel">
                            <i class='bx bx-export'></i>
                        </button>
                    </div>
                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        @include('alert')
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Region</th>
                                <th>NSM</th>
                                <th>Wilayah</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $datas->region ?? '-' }}</td>
                                    <td>{{ $datas->user->nama ?? '-' }}</td>
                                    <td>
                                        @if ($datas->regiondetails->count() > 0)
                                            <ul>
                                                @foreach ($datas->regiondetails->take(2) as $regiondetailsitem)
                                                    <li>{{ $regiondetailsitem->wilayah->wilayah ?? '-' }}</li>
                                                @endforeach
                                                @if ($datas->regiondetails->count() > 3)
                                                    <li>...</li>
                                                @endif
                                            </ul>
                                        @else
                                            Tidak Ada Data
                                        @endif
                                    </td>
                                    <td class="d-flex flex-column flex-sm-row gap-2">
                                        <button data-bs-toggle="modal" data-bs-target="#ModalEdit{{ $datas->id }}"
                                            class="btn btn-warning btn-sm mb-2 mb-sm-0 bx bx-edit">
                                        </button>
                                        <a href="{{ route('regional-detail.show', $datas->id) }}"
                                            class="btn btn-info btn-sm mb-2 mb-sm-0 bx bx-detail">
                                        </a>
                                        <a href="{{ route('regional.destroy', $datas->id) }}"
                                            class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true">
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
    @include('superadmin.region.add')
    {{-- @include('admin.karyawan.edit') --}}
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
