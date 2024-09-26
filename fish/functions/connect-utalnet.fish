function print_colored
    set_color $argv[1]
    echo $argv[2..-1]
    set_color normal
end

function connect-utalnet
    print_colored blue "🌐 Conectando a UTALNET..."
    print_colored yellow "🔑 Obteniendo credenciales..."
    
    set -l username "fcarvajal22@alumnos.utalca.cl"
    set -l password (pass show educandus.cl | head -n 1)
    set -l url "https://hotspot.utalca.cl/login"
    
    print_colored cyan "📡 Enviando solicitud..."
    set -l response (curl -s \
        -d "dst=&popup=true&username=$username&password=$password" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -X POST \
        $url)
    
    if test $status -eq 0
        print_colored green "✅ Conectado a UTALNET exitosamente"
    else
        print_colored red "❌ Error al conectar a UTALNET"
        return 1
    end
    
    print_colored magenta "🔍 Probando conexión..."
    if ping -c 1 -W 5 google.com >/dev/null 2>&1
        print_colored green "✅ Prueba de conexión exitosa"
    else
        print_colored red "❌ Prueba de conexión fallida"
        return 1
    end
    
    print_colored blue "📊 Mostrando información de red:"
    print_colored cyan "IP: "(ip address show dev wlo1 | grep -Eo "[0-9]{3}(\.[0-9]{,3}){3}" | head -n 1)
    print_colored cyan "DNS: "(cat /etc/resolv.conf | grep nameserver | awk '{print $2}' | head -n 1)
    
    print_colored green "🎉 Conexión completada con éxito!"
end
