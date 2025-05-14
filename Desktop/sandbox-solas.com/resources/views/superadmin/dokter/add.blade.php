<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('dokter.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data Dokter || {{ config('app.name') }}
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="dokter" class="form-label">Nama Dokter <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="dokter" id="dokter" required
                                    value="{{ old('dokter') }}" placeholder="Masukan Nama Dokter">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="email" class="form-label">Alamat Email <span
                                        class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" id="email" required
                                    value="{{ old('email') }}" placeholder="Masukan Alamat Email">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">No Telp <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="no_hp" id="no_hp" required
                                    value="{{ old('no_hp') }}" placeholder="Masukan No Hp (WhatsApps)">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Outlet <span class="text-danger">*</span></label>
                                @php
                                    $instansi = App\Models\Instansi::all();
                                @endphp
                                <select name="instansi_id" class="form-select select2">
                                    <option selected disabled>== Pilih Instansi ==</option>
                                    @foreach ($instansi as $item)
                                        <option value="{{ $item->id }}"
                                            {{ old('instansi_id') == $item->id ? 'selected' : '' }}>
                                            {{ $item->instansi }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Cabang <span class="text-danger">*</span></label>
                                @php
                                    $wilayah = App\Models\Wilayah::all();
                                @endphp
                                <select class="form-select select2" name="wilayah_id">
                                    <option selected disabled>== Pilih Cabang ==</option>
                                    @foreach ($wilayah as $item)
                                        <option value="{{ $item->id }}"
                                            {{ old('wilayah_id') == $item->id ? 'selected' : '' }}>{{ $item->wilayah }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Spesialis <span class="text-danger">*</span></label>
                                @php
                                    $spesialis = App\Models\Spesialis::all();
                                @endphp
                                <select name="spesialis_id" class="form-select select2">
                                    <option selected disabled>== Pilih Spesialis ==</option>
                                    @foreach ($spesialis as $item)
                                        <option value="{{ $item->id }}"
                                            {{ old('spesialis_id') == $item->id ? 'selected' : '' }}>
                                            {{ $item->spesialis }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Alamat Rumah <span class="text-primary">*</span></label>
                                <textarea name="alamat_rumah" class="form-control" rows="3">{{ old('alamat_rumah') }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Alamat Praktek <span class="text-primary">*</span></label>
                                <textarea name="alamat_praktek" class="form-control" rows="3">{{ old('alamat_praktek') }}</textarea>
                            </div>
                        </div>
                        <hr class="mb-4 mt-2">
                        <h5>Informasi Rekening</h5>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Bank 1 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="bank_1" id="bank_1" required
                                    value="{{ old('bank_1') }}" placeholder="Masukan Nama Bank">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Rekening 1 <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="rekening_1" id="rekening_1"
                                    required value="{{ old('rekening_1') }}" placeholder="Masukan Rekening">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">A/n <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="atas_nama_1" id="atas_nama_1"
                                    required value="{{ old('atas_nama_1') }}" placeholder="Atas Nama A/n">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Bank 2 <span class="text-primary">*</span></label>
                                <input type="text" class="form-control" name="bank_2" id="bank_2"
                                    value="{{ old('bank_2') }}" placeholder="Masukan Nama Bank">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Rekening 2 <span class="text-primary">*</span></label>
                                <input type="number" class="form-control" name="rekening_2" id="rekening_2"
                                    value="{{ old('rekening_2') }}" placeholder="Masukan Rekening">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">A/n <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="atas_nama_2" id="atas_nama_2"
                                    value="{{ old('atas_nama_2') }}" placeholder="Atas Nama A/n">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Bank 3 <span class="text-primary">*</span></label>
                                <input type="text" class="form-control" name="bank_3" id="bank_3"
                                    value="{{ old('bank_3') }}" placeholder="Masukan Nama Bank">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Rekening 3 <span class="text-primary">*</span></label>
                                <input type="number" class="form-control" name="rekening_3" id="rekening_3"
                                    value="{{ old('rekening_3') }}" placeholder="Masukan Rekening">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">A/n <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="atas_nama_3" id="atas_nama_3"
                                    value="{{ old('atas_nama_3') }}" placeholder="Atas Nama A/n">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeModal" class="btn btn-secondary"
                        data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

@push('scripts')
    <script>
        $(document).ready(function() {
            $('.select2').select2({
                dropdownParent: $('#addData'),
                placeholder: "--- Pilih Salah Satu ---",
                theme: 'bootstrap-5'
            });
        });
    </script>
@endpush
