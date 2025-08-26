<?php if (!empty($home['menu_top'])): ?>
  <ul class="nav navbar-nav">
    <?php foreach ($home['menu_top'] as $key => $value): ?>
      <?php if (!empty($value['child'])): ?>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $value['title'] ?> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <?php foreach ($value['child'] as $ckey => $cvalue): ?>
              <li><a href="<?php echo menu_link($cvalue['link']) ?>"><?php echo $cvalue['title'] ?></a></li>
            <?php endforeach ?>
          </ul>
        </li>
      <?php else: ?>
        <li><a href="<?php echo menu_link($value['link']) ?>"><?php echo $value['title'] ?></a></li>
      <?php endif ?>
    <?php endforeach ?>
  </ul>
<?php endif ?>