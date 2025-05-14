<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('regional.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="region" class="form-label">Region <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="region" id="region" required
                                    value="{{ old('region') }}" placeholder="Masukan Region">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">RSM <span class="text-danger">*</span></label>
                                <select name="user_id" class="form-select select2">
                                    @php
                                        $user = App\Models\user::where('role', 'RSM')->get();
                                    @endphp
                                    <option selected disabled>== Pilih Salah Satu ==</option>
                                    @foreach ($user as $users)
                                        <option value="{{ $users->id }}"
                                            {{ old('user_id') == $users->id ? 'selected' : '' }}>{{ $users->nama }}
                                        </option>
                                    @endforeach
                                </select>
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
