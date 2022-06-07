<div id="modalplantilla" class="modal fade" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content bd-0">
            <div class="modal-header pd-y-20 pd-x-25">
                <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Subir Plantilla</h6>
            </div>
            <div class="modal-body">

                <div class="col-lg-12">
                    <div class="form-group">
                        <label class="form-control-label">Seleccionar Plantilla: <span class="tx-danger">*</span></label>
                        <form enctype="multipart/form-data">
                            <!-- TODO: InputFile para subir archivo -->
                            <input id="upload" type=file name="files[]">
                        </form>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="reset" class="btn btn-outline-secondary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium" aria-label="Close" aria-hidden="true" data-dismiss="modal"><i class="fa fa-close"></i> Cancelar</button>
            </div>

        </div>
    </div>
</div>