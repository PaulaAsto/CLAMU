% include('header.tpl', title='CLAMU')
% include('footer.tpl')
% if mostrar:
    <center>
        <div style="background-color:white">
            <h1>Resultado</h1>
            <p>Metal: {{metal}}</p><br>
            <p>Clasica: {{clasica}}</p><br>
            <p>Cumbia: {{pop}}</p><br>
            <p>Salsa: {{hiphop}}</p><br>
        </div>
    </center>
