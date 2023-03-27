<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Somogyvári Márton</title>
</head>

<body>
    <table>
        <thead>
            <tr>
                <th>Név</th>
                <th>Város neve</th>
                <th>Bussz sorszáma</th>
            </tr>
        </thead>
        <tbody>
            <?php

            $utazasok = array(
                array('Nagy Tibor', 'Szabó Ákos', 'Kovács Géza', 'Hofi Géza'),
                array(' Nagykanizsa', 'Kőszeg', 'Tata', 'Gárdony'),
                array(200, 199, 200, 10)
            );

            foreach ($utazasok as $utazas) {
                echo '<tr>';
                echo '<td>' . $utazas[0] . '</td>';
                echo '<td>' . $utazas[1] . '</td>';
                echo '<td>' . $utazas[2] . '</td>';
                echo '</tr>';
            }
            ?>
        </tbody>
    </table>



    </tbody>
    </table>
</body>

</html>