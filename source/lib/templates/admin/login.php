<form action="/admin/login" method="post">
    <?php
    if (is_array($login)) {
        echo '<p>'.implode('<br />', $login).'</p>';
    }
    ?>
    <input type="text" name="username" placeholder="Username" />
    <input type="password" name="password" placeholder="Password" />
    <br />
    <input type="hidden" name="submitted" value="TRUE" />
    <input type="submit" name="login" value="Login" />
</form>