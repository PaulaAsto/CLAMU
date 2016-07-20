% include('header.tpl', title='CLAMU')
% if mostrar:
<center>
    <div style="background-color:white">
        <h1>Resultado</h1>
        <p>Metal: {{metal}}</p><br>
        <p>Clasica: {{clasica}}</p><br>
        <p>Pop: {{pop}}</p><br>
        <p>Hip hop: {{hiphop}}</p><br>
    </div>
</center>
% include('footer.tpl')
