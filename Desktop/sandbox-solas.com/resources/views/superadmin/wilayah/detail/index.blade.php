@extends('template.app')
@section('loading', 'active')
@section('content')
<!-- Start of Selection -->
<div class="container mt-4">
    <div class="card w-100">
        <div class="card-body">
            <div class="row">
                <div class="col-6 col-md-8">
                    <h5 class="card-title">Detail Data Cabang [{{ $title->wilayah }}]</h5>
                </div>
            </div>
            <div class="table-responsive mt-3">
                <div class="mt-3 mb-4">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addData"><i
                            class='bx bx-plus'></i></button>
                </div>
                <div class="table-responsive">
                    @include('alert')
                    <table id="example" class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 25%">Wilayah</th>
                                <th style="width: 30%">Medical Representative</th>
                                <th style="width: 10%">Kode MR</th>
                                <th style="width: 20%">Area</th>
                                <th style="width: 10%">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($data as $datas)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $datas->wilayah->wilayah ?? '-' }}</td>
                                <td>{{ $datas->user->nama ?? '-' }}</td>
                                <td>{{ $datas->kode_mr ?? '-' }}</td>
                                <td>{{ $datas->area->area ?? '-' }}</td>
                                <td>
                                    <button data-bs-toggle="modal" data-bs-target="#ModalEdit"
                                        class="btn btn-warning btn-sm mb-2 mb-sm-0 bx bx-edit">
                                    </button>
                                    <a href="{{ route('wilayah-detail.destroy', $datas->id) }}"
                                        class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true">
                                    </a>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="5" class="text-center">
                                    <i class='bx bx-rocket'></i> Data Kosong
                                </td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@include('superadmin.wilayah.detail.add')
{{-- @include('admin.cabang.detail.edit') --}}
@endsection
