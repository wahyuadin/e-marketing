@foreach ($data as $datas)
<div class="modal fade" id="editData{{ $datas->id }}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('instansi-data.update', $datas->id) }}" method="POST" class="needs-validation" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Update Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="instansi" class="form-label">Nama Instansi <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="instansi" id="instansi" required
                                    value="{{ old('instansi', $datas->instansi) }}" placeholder="Masukan Nama Instansi">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="nama_singkat" class="form-label">Alamat <span class="text-danger">*</span></label>
                                <textarea name="alamat" class="form-control" cols="30" rows="5">{{ old('alamat', $datas->alamat) }}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeModal" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
  </div>
@endforeach
