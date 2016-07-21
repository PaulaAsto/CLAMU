% include('header.tpl', title='CLAMU')
% if mostrar:
<center>
    <div style="background-color:white">
        <h1>Resultado</h1>
        <p>Rock: {{metal}}</p><br>
        <p>Clasica: {{clasica}}</p><br>
        <p>Cumbia: {{pop}}</p><br>
        <p>Salsa: {{hiphop}}</p><br>
    </div>
</center>
% include('footer.tpl')
