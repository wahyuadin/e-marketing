@extends('template.app')
@section('content')
    @include('sweetalert::alert')
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Konfigurasi WhatsApps</h5>
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
                                <th>Nama</th>
                                <th>No Hp</th>
                                <th>Session / Token API</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $datas)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $datas->nama ?? '-' }}</td>
                                    <td>0{{ $datas->no_hp ?? '-' }}</td>
                                    <td>
                                        <div id="qrcode-{{ $datas->session ?? 'null' }}"></div>
                                    </td>
                                    <td class="d-flex flex-column flex-sm-row gap-2">
                                        <!-- Tombol Hapus -->
                                        <a href="{{ route('whatsapp.destroy', $datas->id) }}"
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
    @include('superadmin.whatsapp.add')
    @include('superadmin.whatsapp.edit')
    @push('style')
        {{-- datatable --}}
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
    @endpush

    @push('scripts')
        {{-- Datatable --}}
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>
        <script>
            new DataTable('#example');
            document.addEventListener("DOMContentLoaded", function() {
                new QRCode(document.getElementById("qrcode-{{ $datas->session ?? 'null' }}"), {
                    text: "{{ $datas->session ?? '-' }}",
                    width: 100,
                    height: 100
                });
            });
        </script>
    @endpush
@endsection
