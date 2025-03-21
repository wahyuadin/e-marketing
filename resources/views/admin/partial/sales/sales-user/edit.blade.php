@extends('template.app')
@section('content')
<div class="container mt-4">
    <div class="card">
        <div class="card-body">
            <form action="{{ route('sales.user.update', $data->id) }}" method="POST" class="needs-validation" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Data | Sales Harian</h1>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="nama_sales" class="form-label">Nama AM <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="nama_sales" id="nama_sales" required
                            value="{{ old('nama_sales', $data->nama_sales) }}" placeholder="Masukan Nama AM">
                    </div>
                    @php
                        $area_manager = App\Models\sales\AreaManagerModel::all();
                        $target = App\Models\sales\SalesTargetModel::all();
                    @endphp
                    <div class="mb-3">
                        <label for="area_manager_id" class="form-label">Kode MR <span class="text-danger">*</span></label>
                        <select name="area_manager_id" id="area_manager_id" class="form-select" required>
                            <option value="">Pilih Kode MR</option>
                            @foreach ($area_manager as $item)
                                <option value="{{ $item->id }}" {{ $item->id == $data->area_manager_id ? 'selected' : '' }}><b>{{ $item->kode_area_manager }}</b>, {{ $item->wilayah }} - {{ $item->nama_area_manager }}, {{ $item->regional->nama_regional }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="sales_target_id" class="form-label">Target <span class="text-danger">*</span></label>
                        <select name="sales_target_id" id="sales_target_id" class="form-select" required>
                            <option value="">Pilih Target</option>
                            @foreach ($target as $item)
                                <option value="{{ $item->id }}" {{ $item->id == $data->sales_target_id ? 'selected' : '' }}>{{ $item->nama_target }} || Rp. {{ number_format($item->nominal) }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="penjualan" class="form-label">Penjualan <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" name="penjualan" id="penjualan" required
                            value="{{ old('penjualan', $data->penjualan) }}" placeholder="Masukan Penjualan">
                    </div>
                    <div class="mb-3">
                        <label for="tanggal" class="form-label">Tanggal <span class="text-danger">*</span></label>
                        <input type="date" class="form-control" name="tanggal" id="tanggal" required
                            value="{{ old('tanggal', $data->tanggal) }}">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="{{ route('sales.user.admin') }}" t class="btn btn-secondary">Tutup</a>
                    <button type="submit" id="submitButtonPost" class="btn btn-primary">Simpan Perubahan</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection
