<form method="post" action="{{ route('self-schedule.store') }}" id="formEvent">
    @csrf
    <div class="modal fade" id="addData" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Self Schedule Daily Visit</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 mb-3" id="kategoriWrapper">
                            <label class="form-label">Kategori</label>
                            <select id="kategori" class="form-select select2">
                                <option value="">-- Pilih Salah Satu --</option>
                                <option value="dokter">Dokter</option>
                                <option value="outlet">Outlet</option>
                            </select>
                        </div>

                        <!-- Hidden di awal -->
                        <div class="col-md-6 mb-3" id="dokterSelect" style="display: none;">
                            <label class="form-label">Dokter</label>
                            <select name="dokter_id" id="dokter" class="form-select select2">
                                <option value="">-- Pilih Salah Satu --</option>
                                @foreach (App\Models\Dokter::all() as $item)
                                    <option value="{{ $item->id }}">{{ $item->dokter }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-6 mb-3" id="outletSelect" style="display: none;">
                            <label class="form-label">Outlet</label>
                            <select name="instansi_id" id="outlet" class="form-select select2">
                                <option value="">-- Pilih Salah Satu --</option>
                                @foreach (App\Models\Instansi::all() as $item)
                                    <option value="{{ $item->id }}">{{ $item->instansi }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label">Keterangan</label>
                            <textarea name="keterangan" id="keterangan" rows="3" class="form-control" placeholder="Contoh: Garapan"></textarea>
                        </div>
                        <input type="hidden" id="tanggal">
                        <div class="col-md-2 mb-3 d-flex align-items-end">
                            <button type="button" class="btn btn-success btn-sm" id="addRow">Tambah Data</button>
                        </div>

                        <div class="col-12 mt-3">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="tableInput">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Tanggal</th>
                                            <th>Dokter</th>
                                            <th>Outlet</th>
                                            <th>Keterangan</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="submitBtn" disabled>Simpan Semua</button>
                </div>
            </div>
        </div>
    </div>
</form>
