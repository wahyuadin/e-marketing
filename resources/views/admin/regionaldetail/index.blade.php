@extends('template.app')
@section('loading', 'active')
@section('content')

<!-- Start of Selection -->
<div class="container mt-4">
    <div class="card w-100">
        <div class="card-body">
            <div class="row">
                <div class="col-6 col-md-8">
                    <h5 class="card-title">Data Regional Detail [<b>{{ $data->nama_regional }}</b>]</h5>
                </div>
            </div>
            @include('alert')
            <div class="table-responsive mt-3">
                <div class="mt-3 mb-4">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData"><i class='bx bx-plus'></i></button>
                </div>
                <table id="example" class="table table-striped table-bordered w-100 mt-3">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Regional</th>
                            <th>Cabang</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $index = 1;
                        @endphp
                        @foreach ($data->regionalDetail as $datas)
                        <tr>
                            <td>{{ $index++ }}</td>
                            <td>{{ $datas->regional->nama_regional }}</td>
                            <td>{{ $datas->cabang->cabang }}</td>
                            <td>
                                <div class="d-flex flex-column flex-sm-row gap-2">
                                    <button data-bs-toggle="modal" data-bs-target="#editData{{ $datas->id }}"
                                        class="btn btn-warning btn-sm mb-2 mb-sm-0 bx bx-edit">
                                    </button>
                                    <a href="{{ route('regional-detail.destroy', $datas->id) }}" class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"></a>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@include('admin.regionaldetail.add')
@include('admin.regionaldetail.edit')
<!-- End of Selection -->
@endsection

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

