@extends('template.app')
@section('loading', 'active')
@section('content')
<div class="container mt-4">
    <div class="card w-100">
        <div class="card-body">
            <div class="row">
                <div class="col-6 col-md-8">
                    <h5 class="card-title">Data Sales Harian</h5>
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
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#tambahSalesUser">
                        <i class='bx bx-plus'></i>
                    </button>
                    <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#filterSalesUser">
                        <i class='bx bx-filter'></i>
                    </button>
                    <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#importExcel">
                        <i class='bx bx-import'></i>
                    </button>
                </div>

                <table id="salesUserTable" class="table table-striped table-bordered w-100">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Penanggung Jawab</th>
                            <th>Tanggal</th>
                            <th>Nama AM</th>
                            <th>Regional</th>
                            <th>Area Manager</th>
                            <th>Wilayah</th>
                            <th>Target</th>
                            <th>Penjualan</th>
                            <th>Achievement</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

@component('components.modal', [
    'modal_id' => 'tambahSalesUser',
    'title' => 'Tambah Data | Sales Harian',
    'body' => 'admin.partial.sales.sales-user.add',
])
@endcomponent

@component('components.filter', [
    'modal_id' => 'filterSalesUser',
    'title' => 'Filter Data | Sales Harian',
    'body' => 'admin.partial.sales.sales-user.filter',
])
@endcomponent

@component('components.modal', [
    'modal_id' => 'importExcel',
    'title' => 'Import Data | Sales Harian',
    'body' => 'admin.partial.sales.sales-user.import',
])
@endcomponent
@endsection

@push('style')
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
@endpush
{{-- @dd($_GET['start_date']) --}}
@push('scripts')
    <!-- Pastikan urutan script benar -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.2/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        if (window.jQuery) {
            $(function() {
                // Cek apakah DataTables tersedia
                if ($.fn.DataTable) {
                    try {
                        // Gunakan inisialisasi aman
                        var table = $('#salesUserTable').DataTable({
                            processing: true,
                            serverSide: true,
                            responsive: true,
                            ajax: {
                                url: '{{ route("sales.user.data-table") }}',
                                type: 'GET',
                                data: function(d) {
                                    d.start_date = $('#start_date').val();
                                    d.end_date = $('#end_date').val();
                                }
                            },
                            columns: [
                                {
                                    data: 'DT_RowIndex',
                                    name: 'DT_RowIndex',
                                    orderable: false,
                                    searchable: false
                                },
                                { data: 'user_name', name: 'user.nama' },
                                { data: 'tanggal_formatted', name: 'tanggal' },
                                { data: 'nama_sales', name: 'nama_sales' },
                                { data: 'regional', name: 'areaManager.regional.nama_regional' },
                                { data: 'area_manager', name: 'areaManager.nama_area_manager' },
                                { data: 'area_manager_wilayah', name: 'areaManager.wilayah' },
                                { data: 'target', name: 'salesTarget.nominal' },
                                { data: 'penjualan', name: 'penjualan' },
                                { data: 'achievement', name: 'achievement' },
                                {
                                    data: 'action',
                                    name: 'action',
                                    orderable: false,
                                    searchable: false
                                }
                            ]
                        });
                        $('#filterForm').on('submit', function(e) {
                            e.preventDefault();

                            // Reload tabel dengan parameter filter baru
                            table.ajax.reload();

                            // Tutup modal filter
                            $('#filterSalesUser').modal('hide');
                        });
                    } catch (error) {
                        console.error('DataTables Initialization Error:', error);

                        // Tampilkan pesan error yang lebih jelas
                        Swal.fire({
                            icon: 'error',
                            title: 'Kesalahan Inisialisasi',
                            text: 'Tidak dapat memuat tabel. Silakan hubungi administrator.'
                        });
                    }
                } else {
                    console.warn('DataTables tidak tersedia');

                    // Tampilkan pesan jika DataTables tidak tersedia
                    Swal.fire({
                        icon: 'warning',
                        title: 'DataTables Tidak Ditemukan',
                        text: 'Aplikasi memerlukan DataTables untuk berfungsi dengan baik.'
                    });
                }
            });
        } else {
            console.error('jQuery tidak tersedia');

            // Tampilkan pesan jika jQuery tidak tersedia
            Swal.fire({
                icon: 'error',
                title: 'jQuery Tidak Ditemukan',
                text: 'Aplikasi memerlukan jQuery untuk berfungsi dengan baik.'
            });
        }
    });

    </script>
@endpush
