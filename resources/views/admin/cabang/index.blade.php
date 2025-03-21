@extends('template.app')
@section('loading', 'active')
@section('content')
    <!-- Start of Selection -->
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Data Cabang</h5>
                    </div>
                </div>
                @include('alert')
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData"><i
                                class='bx bx-plus'></i></button>
                    </div>
                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Cabang</th>
                                <th>Karyawan</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                            <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $datas->cabang }}</td>
                                    <td>
                                        @if($datas->cabangdetail)
                                            <ul>
                                                @foreach ($datas->cabangdetail->take(2) as $cabangDetailitem)
                                                    <li>{{ $cabangDetailitem->karyawan->nama_karyawan ?? '-' }}</li>
                                                @endforeach
                                                @if ($datas->cabangdetail->count() > 3)
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
                                        {{-- <button data-bs-toggle="modal" data-bs-target="#ModalDetail"
                                            class="btn btn-info btn-sm mb-2 mb-sm-0 bx bx-detail">
                                        </button> --}}
                                        <a href="{{ route('cabang-detail.index', $datas->id) }}"
                                            class="btn btn-info btn-sm mb-2 mb-sm-0 bx bx-detail">
                                        </a>
                                        <a href="{{ route('cabang-data.destroy', $datas->id) }}"
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
    @include('admin.cabang.add')
    @include('admin.cabang.edit')
    @include('admin.cabang.detail')
@endsection
