@extends('template.app')
@section('loading', 'active')
@section('content')
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Data Master User</h5>
                    </div>
                </div>
                @include('alert')
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#tambahUser"><i
                                class='bx bx-plus'></i></button>
                    </div>
                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Master User</th>
                                <th>NIP</th>
                                <th>Role</th>
                                <th>Gambar</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $no = 1;
                            @endphp
                            @foreach ($data as $datas)
                                <tr>
                                    <td>{{ $no++ }}</td>
                                    <td>{{ $datas->nama }}</td>
                                    <td>{{ $datas->nip }}</td>
                                    <td>{{ $datas->accept == 0 ? 'Admin' : 'Super Admin' }}</td>
                                    <td>
                                        <img src="{{ asset('assets/profile/' . $datas->foto) }}" alt="{{ $datas->foto }}"
                                            class="img-fluid"
                                            style="width: 50px; height: 50px; object-fit: cover; display: block; margin: 0 auto;">
                                    </td>
                                    <td class="d-flex flex-column flex-sm-row">
                                        <button data-bs-toggle="modal" data-bs-target="#ModalEdit{{ $datas->id }}"
                                            class="btn btn-warning btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-edit"></button>
                                        <a href="{{ route('master-user.delete', $datas->id) }}"
                                            class="btn btn-danger btn-sm bx bx-trash" data-confirm-delete="true"></a>
                                    </td>
                                </tr>
                                @component('components.modal', [
                                    'modal_id' => 'ModalEdit' . $datas->id,
                                    'data' => $datas,
                                    'title' => 'Edit Data | Master User',
                                    'body' => 'admin.partial.user.edit',
                                ])
                                @endcomponent
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @component('components.modal', [
        'modal_id' => 'tambahUser',
        'title' => 'Tambah Data | Master User',
        'body' => 'admin.partial.user.add',
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
    <script>
        document.getElementById('togglePassword').addEventListener('click', function() {
            const passwordInput = document.getElementById('password');
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.querySelector('i').classList.toggle('bx-show');
            this.querySelector('i').classList.toggle('bx-hide');
        });
        document.getElementById('addpw').addEventListener('click', function() {
            const passwordInput = document.getElementById('addpwd');
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.querySelector('i').classList.toggle('bx-show');
            this.querySelector('i').classList.toggle('bx-hide');
        });
    </script>
@endpush
