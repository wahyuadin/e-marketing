<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('pengajuan-dokter.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data Pengajuan Dokter ||
                        {{ config('app.name') }}
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="dokter" class="form-label">Dokter <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="dokter" placeholder="Masukan Dokter"
                                    required value="{{ old('dokter') }}">
                            </div>
                        </div>
                        <!-- Pilih Dokter -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="cabang" class="form-label">Cabang <span
                                        class="text-danger">*</span></label>
                                <select id="cabang" name="wilayah_id" class="form-select select2" required>
                                    <option {{ Auth::user()->role == 'superadmin' ? 'selected' : '' }} disabled
                                        selected>
                                        == Pilih Cabang ==
                                    </option>
                                    @php
                                        use App\Models\Wilayah;
                                        use App\Models\User;
                                        use Illuminate\Support\Facades\Auth;

                                        $cabang = [];

                                        if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin') {
                                            $cabang = Wilayah::all();
                                        } else {
                                            $user = User::with('wilayah')->find(Auth::user()->id);

                                            // Asumsinya relasi 'wilayah' adalah hasMany
                                            $firstWilayah = optional($user->wilayah)->first(); // aman dari null

                                            if ($firstWilayah) {
                                                $cabang = Wilayah::where('id', $firstWilayah->id)->get();
                                            }
                                        }
                                        $selectedWilayahId = optional(optional($data->first())->wilayah)->id;
                                    @endphp

                                    @foreach ($cabang as $Item)
                                        <option value="{{ $Item->id }}"
                                            {{ old('wilayah_id', $selectedWilayahId) == $Item->id ? 'selected' : '' }}>
                                            {{ $Item->wilayah }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="instansi" class="form-label">Outlet <span
                                        class="text-danger">*</span></label>
                                <select name="instansi_id" class="form-select select2" required>
                                    <option selected disabled>== Pilih Outlet ==</option>
                                    @php
                                        $instansi = App\Models\Instansi::all();
                                    @endphp
                                    @foreach ($instansi as $item)
                                        <option value="{{ $item->id }}">{{ $item->instansi }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="spesialis" class="form-label">Spesialis <span
                                        class="text-danger">*</span></label>
                                <select name="spesialis_id" class="form-select select2" required>
                                    <option selected disabled>== Pilih Spesialis ==</option>
                                    @php
                                        $spesialis = App\Models\Spesialis::all();
                                    @endphp
                                    @foreach ($spesialis as $item)
                                        <option value="{{ $item->id }}">{{ $item->spesialis }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email <span
                                        class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" id="email" required
                                    value="{{ old('email') }}" placeholder="Masukkan Alamat Email">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="no_hp" class="form-label">No Telp (WA) <span
                                        class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="no_hp" id="no_hp" required
                                    value="{{ old('no_hp') }}" placeholder="Masukkan No Telepon">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="alamat" class="form-label">Alamat Rumah<span
                                        class="text-primary">*</span></label>
                                <textarea name="alamat_rumah" class="form-control" rows="5">{{ old('alamat_rumah') }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="alamat" class="form-label">Alamat Praktek<span
                                        class="text-primary">*</span></label>
                                <textarea name="alamat_praktek" class="form-control" rows="5">{{ old('alamat_praktek') }}</textarea>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <h5>Informasi Rekening</h5>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="bank_1" class="form-label">Bank 1 <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="bank_1" id="bank_1" required
                                    value="{{ old('bank_1') }}" placeholder="Masukkan Nama Bank">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="rekening_1" class="form-label">Nomor Rekening <span
                                        class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="rekening_1" id="rekening_1"
                                    required value="{{ old('rekening_1') }}" placeholder="Masukkan No Rekening">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="atas_nama_1" class="form-label">A/n <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="atas_nama_1" id="atas_nama_1"
                                    required value="{{ old('atas_nama_1') }}" placeholder="Atas Nama ..">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="bank_2" class="form-label">Bank 2 <span
                                        class="text-primary">*</span></label>
                                <input type="text" class="form-control" name="bank_2" id="bank_2"
                                    value="{{ old('bank_2') }}" placeholder="Masukkan Nama Bank">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="rekening_2" class="form-label">Nomor Rekening <span
                                        class="text-primary">*</span></label>
                                <input type="number" class="form-control" name="rekening_2" id="rekening_2"
                                    value="{{ old('rekening_2') }}" placeholder="Masukkan No Rekening">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="atas_nama_2" class="form-label">A/n <span
                                        class="text-primary">*</span></label>
                                <input type="text" class="form-control" name="atas_nama_2" id="atas_nama_2"
                                    value="{{ old('atas_nama_2') }}" placeholder="Atas Nama ..">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="bank_3" class="form-label">Bank 3 <span
                                        class="text-primary">*</span></label>
                                <input type="text" class="form-control" name="bank_3" id="bank_3"
                                    value="{{ old('bank_3') }}" placeholder="Masukkan Nama Bank">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="rekening_3" class="form-label">Nomor Rekening <span
                                        class="text-primary">*</span></label>
                                <input type="number" class="form-control" name="rekening_3" id="rekening_3"
                                    value="{{ old('rekening_3') }}" placeholder="Masukkan No Rekening">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="atas_nama_3" class="form-label">A/n <span
                                        class="text-primary">*</span></label>
                                <input type="text" class="form-control" name="atas_nama_3" id="atas_nama_3"
                                    value="{{ old('atas_nama_3') }}" placeholder="Atas Nama ..">
                            </div>
                        </div>
                    </div>
                    <!-- Tombol Modal -->
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
