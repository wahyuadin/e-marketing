<div class="modal-content">
    <form action="{{ route('sales.area-manager.store') }}" method="POST" class="needs-validation" enctype="multipart/form-data">
        @csrf
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">{{ $title }}</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="mb-3">
                        <label for="nama_area_manager" class="form-label">Nama Area Manager <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="nama_area_manager" id="nama_area_manager" required
                            value="{{ old('nama_area_manager') }}" placeholder="Masukan Nama Area Manager">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="nama_regional" class="form-label">Regional <span class="text-danger">*</span></label>
                        <select name="regional_id" id="regional_id" class="form-select" required>
                            <option selected disabled>Pilih Regional</option>
                            @php
                                $regional = App\Models\sales\SalesRegionalModel::all();
                            @endphp
                            @foreach ($regional as $item)
                                <option value="{{ $item->id }}">{{ $item->nama_regional }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="jabatan_id" class="form-label">Jabatan <span class="text-danger">*</span></label>
                        <select name="jabatan_id" id="jabatan_id" class="form-select" required>
                            <option selected disabled>== Pilih Jabatan ==</option>
                            @php
                                $jabatan = App\Models\Jabatan::all();
                            @endphp
                            @foreach ($jabatan as $item)
                                <option value="{{ $item->id }}">{{ $item->jabatan }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="wilayah" class="form-label">Wilayah <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="wilayah" id="wilayah" required
                            value="{{ old('wilayah') }}" placeholder="Masukan Wilayah">
                    </div>
                    <div class="mb-3">
                        <label for="kode_area_manager" class="form-label">Kode MR <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="kode_area_manager" id="kode_area_manager" required
                            value="{{ old('kode_area_manager') }}" placeholder="Masukan Kode MR">
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" id="closeModal" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" id="submitButtonPost" class="btn btn-primary">Save changes</button>
        </div>
    </form>
</div>
