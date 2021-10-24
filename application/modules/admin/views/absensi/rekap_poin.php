<?php if (!empty($data)) : ?>  <div class="panel panel-default">
    <div class="panel-heading">
      Rekap Berdasarkan Bulan
    </div>
    <div class="panel-body">
      <form action="" method="get">
        <div class="form-group">
          <input type="month" class="form-control" name="my" value="<?php echo !empty($month_year) ? $month_year : ''; ?>">
        </div>
        <div class="form-group">
          <button class="btn btn-sm btn-default">Submit</button>
        </div>
      </form>
    </div>
  </div>
  <div class="box">
    <table class="table table-bordered">
      <thead>
        <th>NO</th>
        <th>KARYAWAN</th>
        <th>BERANGKAT AWAL</th>
        <th>TELAT BERANGKAT</th>
        <th>PULANG LEMBUR</th>
      </thead>
      <tbody>
        <?php $i = 1; ?>
        <?php foreach ($data['data'] as $key => $value) : ?>
          <?php 
          $berangkat = @intval($value['berangkat']);
          $telat     = @intval($value['telat']);
          $pulang    = @intval($value['pulang']);
          ?>
          <tr>
            <td><?php echo $i++; ?></td>
            <td><?php echo $value['karyawan'] ?></td>
            <td <?php echo ' '.$berangkat == $data['max']['berangkat'] ? 'class="bg-success"':'';?> ><?php echo $berangkat;?></td>
            <td><?php echo $telat ?></td>
            <td <?php echo ' '.$pulang == $data['max']['pulang'] ? 'class="bg-success"':'';?>><?php echo $pulang ?></td>
          </tr>
        <?php endforeach ?>
      </tbody>
    </table>
  </div>
<?php endif ?>