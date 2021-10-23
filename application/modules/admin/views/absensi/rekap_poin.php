<?php if(!empty($data)):?>
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
        <?php foreach($data AS $key => $value):?>
        <tr>
          <td><?php echo $i++; ?></td>
          <td><?php echo $value['karyawan'] ?></td>
          <td><?php echo $value['berangkat'] ?></td>
          <td><?php echo $value['telat'] ?></td>
          <td><?php echo $value['pulang'] ?></td>
        </tr>
        <?php endforeach?>
      </tbody>
    </table>
  </div>
<?php endif?>