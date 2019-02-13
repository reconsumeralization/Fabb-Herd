<?php

/* 
 * Copyright SMG Design 2014
 * <richard.wilson@smgdesign.org>
 */
header("Content-Type: application/json");
echo json_encode(\admin\delete::run());