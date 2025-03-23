@foreach ($data->cabangdetail as $datas)
    <div class="modal fade" id="ModalEdit{{ $datas->id }}" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <form action="" method="POST" class="needs-validation" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Update Data</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="cabang" class="form-label">Nama Cabang <span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control" value="{{ $datas->cabang->cabang }}"
                                        disabled>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="cabang" class="form-label">Nama Karyawan <span
                                            class="text-danger">*</span></label>
                                    <select name="karyawan_id" class="form-select">
                                        <option selected disabled>== Pilih Karyawan ==</option>
                                        @php
                                            $karyawan = App\Models\karyawan::all();
                                        @endphp
                                        @foreach ($karyawan as $item)
                                            <option value="{{ $item->id }}"
                                                {{ $item->id == $datas->karyawan->id ? 'selected' : '' }}>
                                                {{ $item->nama_karyawan }}</option>
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
@endforeach
