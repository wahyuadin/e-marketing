@extends('template.app')
@section('content')
    @include('sweetalert::alert')
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Data Laporan Bug</h5>
                        <small>Mohon maap, punteun bapa ibu kalo ada bug di report yaah <br>Hatur Nuhunnns</small>
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
                                <th>Tanggal</th>
                                <th>Judul</th>
                                <th>Deskripsi Bug</th>
                                <th>Foto</th>
                                <th>Status Perbaikan</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $datas)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $datas->created_at ?? '-' }}</td>
                                    <td>{{ $datas->title ?? '-' }}</td>
                                    <td>{{ $datas->content ?? '-' }}</td>
                                    <td>
                                        @if (!empty($datas->gambar))
                                            <a href="{{ asset('assets/bug/' . $datas->gambar) }}" target="_blank">
                                                <img src="{{ asset('assets/bug/' . $datas->gambar) }}" alt="Foto Marki"
                                                    class="rounded shadow-sm"
                                                    style="width: 100px; height: 100px; object-fit: cover; max-width: 100%;">
                                            </a>
                                        @else
                                            <span class="badge bg-danger">Tidak ada foto</span>
                                        @endif
                                    </td>
                                    <td>
                                        <span class="badge {{ $datas->status == 'pending' ? 'bg-danger' : 'bg-success' }}">
                                            {{ ucwords($datas->status) }}
                                        </span>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @include('bug-report.add')
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
                new QRCode(document.getElementById("qrcode-{{ $datas->id ?? 'null' }}"), {
                    text: "{{ $datas->session ?? '-' }}",
                    width: 100,
                    height: 100
                });
            });
        </script>
    @endpush
@endsection
