@foreach ($data as $datas)
    <div class="modal fade" id="editData{{ $datas->id }}" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <form action="{{ route('area.update', $datas->id) }}" method="POST" class="needs-validation"
                    enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Data Area ||
                            {{ config('app.name') }}
                        </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Nama Area <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" value="{{ old('area', $datas->area) }}"
                                        name="area" placeholder="Masukan Nama Area" required>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="closeModal" class="btn btn-secondary"
                                data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endforeach
