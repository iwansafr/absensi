<?php defined('BASEPATH') OR exit('No direct script access allowed');

$bc_count = $this->db->query('SELECT count(bc) AS bc_count FROM karyawan WHERE bc = 1')->row_array();
$sent_count = $this->db->query('SELECT count(sent) AS sent_count FROM absensi WHERE sent = 1 AND date(waktu) = ?',date('Y-m-d'))->row_array();
?>
<div class="panel panel-default">
    <div class="panel panel-heading">
        Member Data
    </div>
    <div class="panel panel-body">
        <table class="table">
            <tr>
                <td>Bulang</td>
                <td>: <?php echo date('Y-M') ?></td>
            </tr>
            <tr>
                <td>Member</td>
                <td>: <?php echo $bc_count['bc_count']; ?></td>
            </tr>        
            <tr>
                <td>Pesan Terkirim</td>
                <td>: <?php echo $sent_count['sent_count'] ?></td>
            </tr>        
        </table>
    </div>
</div>