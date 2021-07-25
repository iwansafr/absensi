<?php

$get = $_GET;
$id = !empty($get['id']) ? intval($get['id']) : 0;
if(empty($get['p'])){
  ?>
  <form action="" method="get">
    <div class="panel panel-default">
      <div class="panel-heading">Pilih Provinsi</div>
      <div class="panel-body">
        <div class="form-group">
          <label for="">Provinsi</label>
          <input type="hidden" name="id" value="<?php echo $id;?>">
          <select name="p" class="form-control select2">
            <?php foreach ($provinces as $key => $value): ?>
              <option value="<?php echo $value['id'] ?>"><?php echo $value['name'] ?></option>
            <?php endforeach ?>
          </select>
        </div>
      </div>
      <div class="panel-footer">
        <button class="btn btn-sm btn-default" type="submit">Submit</button>
      </div>
    </div>
  </form>
  <?php
}else if(empty($get['r'])){
  ?>
  <form action="" method="get">
    <div class="panel panel-default">
      <div class="panel-heading">Pilih Kabupaten</div>
      <div class="panel-body">
        <div class="form-group">
          <input type="hidden" name="p" value="<?php echo $get['p'] ?>">
          <label for="">Kabupaten</label>
          <select name="r" class="form-control select2">
            <?php foreach ($regencies as $key => $value): ?>
              <option value="<?php echo $value['id'] ?>"><?php echo $value['name'] ?></option>
            <?php endforeach ?>
          </select>
        </div>
      </div>
      <div class="panel-footer">
        <button class="btn btn-sm btn-default" type="submit">Submit</button>
      </div>
    </div>
  </form>
  <?php
}else if(empty($get['d'])){
  ?>
  <form action="" method="get">
    <div class="panel panel-default">
      <div class="panel-heading">Pilih Kecamatan</div>
      <div class="panel-body">
        <div class="form-group">
          <input type="hidden" name="p" value="<?php echo $get['p'] ?>">
          <input type="hidden" name="r" value="<?php echo $get['r'] ?>">
          <label for="">Kecamatan</label>
          <select name="d" class="form-control select2">
            <?php foreach ($districts as $key => $value): ?>
              <option value="<?php echo $value['id'] ?>"><?php echo $value['name'] ?></option>
            <?php endforeach ?>
          </select>
        </div>
      </div>
      <div class="panel-footer">
        <button class="btn btn-sm btn-default" type="submit">Submit</button>
      </div>
    </div>
  </form>
  <?php
}else{
  $form = new zea();

  $form->init('edit');

  $form->setHeading('<a href="'.base_url('admin/instansi/batas_jarak/'.$id.'/atur-jarak').'" class="pull-right btn-sm btn btn-warning"><i class="fa fa-cog"></i>Atur Jarak</a>');

  $form->setId($id);
  $form->setTable('instansi');
  $form->addInput('nama','text');

  $form->addInput('alamat','textarea');

  $form->addInput('longitude','hidden');
  $form->addInput('latitude','hidden');
  $form->addInput('phone','text');
  $form->setType('phone','number');
  $form->addInput('email','text');
  $form->setType('email','email');

  $form->addInput('province_id','dropdown');
  $form->setOptions('province_id',[$provinces['id']=>$provinces['name']]);
  $form->setLabel('province_id','Provinsi');
  $form->addInput('regency_id','dropdown');
  $form->setOptions('regency_id',[$regencies['id']=>$regencies['name']]);
  $form->setLabel('regency_id','Kabupaten');
  $form->addInput('district_id','dropdown');
  $form->setOptions('district_id',[$districts['id']=>$districts['name']]);
  $form->setLabel('district_id','Kecamatan');

  $form->addInput('website','text');
  $form->setRequired('All');

  $form->addInput('logo','image');
  $form->setAccept('logo','.jpg,.png,.jpeg');

  $form->form();
  ?>
  <div id="map" style="width: 70%; height: 300px;"></div>
  <?php
}