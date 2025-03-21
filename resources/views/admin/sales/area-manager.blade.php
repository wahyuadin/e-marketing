@extends('template.app')
@section('loading', 'active')
@section('content')
<!-- Start of Selection -->
<div class="container mt-4">
    <div class="card w-100">
        <div class="card-body">
            <div class="row">
                <div class="col-6 col-md-8">
                    <h5 class="card-title">Data Area Manager</h5>
                </div>
            </div>
            @if ($errors->any())
                <div class="alert alert-danger mt-3">
                    @foreach ($errors->all() as $error)
                        <p>{{ $error }}</p>
                    @endforeach
                </div>
            @endif
            <div class="table-responsive mt-3">
                <div class="mt-3 mb-4">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#tambahAreaManager"><i class='bx bx-plus'></i></button>
                </div>
                <table id="example" class="table table-striped table-bordered w-100 mt-3">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Regional</th>
                            <th>Jabatan</th>
                            <th>Area Manager</th>
                            <th>Wilayah</th>
                            <th>Kode MR</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $no = 1;
                        @endphp
                        @foreach($data as $datas)
                        <tr>
                            <td>{{ $no++ }}</td>
                            <td>{{ $datas->regional->nama_regional }}</td>
                            <td>{{ $datas->jabatan->jabatan ?? '-' }}</td>
                            <td>{{ $datas->nama_area_manager }}</td>
                            <td>{{ $datas->wilayah }}</td>
                            <td>{{ $datas->kode_area_manager }}</td>
                            <td class="d-flex flex-column flex-sm-row">
                                <button data-bs-toggle="modal" data-bs-target="#ModalEdit{{ $datas->id }}" class="btn btn-warning btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-edit"></button>
                                <a href="{{ route('sales.area-manager.delete', $datas->id) }}" class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"></a>

                            </td>
                            </tr>
                        @component('components.modal', [
                            'modal_id' => 'ModalEdit'. $datas->id,
                            'data'    => $datas,
                            'title' => 'Edit Data | Area Manager',
                            'body' => 'admin.partial.sales.area-manager.edit',
                        ])
                        @endcomponent
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- End of Selection -->
@component('components.modal', [
    'modal_id' => 'tambahAreaManager',
    'title' => 'Tambah Data | Area Manager',
    'body' => 'admin.partial.sales.area-manager.add',
])
@endcomponent
@endsection

@push('style')
    {{-- datatable --}}
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
@endpush

@push('scripts')
    {{-- Datatable --}}
    {{-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> --}}
    {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script> --}}
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>
    <script>
        new DataTable('#example');
    </script>
@endpush
