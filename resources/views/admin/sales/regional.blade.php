@extends('template.app')
@section('loading', 'active')
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
            @if ($errors->any())
                <div class="alert alert-danger mt-3">
                    @foreach ($errors->all() as $error)
                        <p>{{ $error }}</p>
                    @endforeach
                </div>
            @endif
            <div class="table-responsive mt-3">
                <div class="mt-3 mb-4">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#tambahRegional"><i class='bx bx-plus'></i></button>
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
                            $no = 1;
                        @endphp
                        @foreach($data as $datas)
                        <tr>
                            <td>{{ $no++ }}</td>
                            <td>{{ $datas->nama_regional }}</td>
                            <td>
                                <ul>
                                    @foreach ($datas->regionalDetail->take(2) as $regionalDetailitem)
                                        <li>{{ $regionalDetailitem->cabang->cabang }}</li>
                                    @endforeach
                                    @if ($datas->regionalDetail->count() > 3)
                                        <li>...</li>
                                    @elseif ($datas->regionalDetail->count() == 0)
                                        <li>Tidak Ada Data</li>
                                    @endif
                                </ul>
                            </td>
                            <td>
                                <div class="d-flex flex-column flex-sm-row gap-2">
                                    <button data-bs-toggle="modal" data-bs-target="#ModalEdit{{ $datas->id }}"
                                        class="btn btn-warning btn-sm mb-2 mb-sm-0 bx bx-edit">
                                    </button>
                                    <a href="{{ route('regional-detail.index', $datas->id) }}"
                                        class="btn btn-info btn-sm mb-2 mb-sm-0 bx bx-detail">
                                    </a>
                                    <a href="{{ route('regional-data.destroy', $datas->id) }}" class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"></a>
                                </div>
                            </td>
                            </tr>
                        @component('components.modal', [
                            'modal_id' => 'ModalEdit'. $datas->id,
                            'data'    => $datas,
                            'title' => 'Edit Data | Regional',
                            'body' => 'admin.partial.sales.regional.edit',
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
    'modal_id' => 'tambahRegional',
    'title' => 'Tambah Data | Regional',
    'body' => 'admin.partial.sales.regional.add',
])
@endcomponent
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

