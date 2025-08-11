%Calibrador anemometros (para Mac) recargado
classdef Calibrador_Recharged < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure        matlab.ui.Figure%
        TextArea_13   matlab.ui.control.TextArea  % Historial de rutas de anemómetros
        TextArea_12     matlab.ui.control.TextArea  % Historial general de rutas
        SaveButton      matlab.ui.control.Button %GuardarButton
        TextArea_10  matlab.ui.control.EditField % Campo de mensajes de anemómetros
        TextArea_9    matlab.ui.control.EditField % Campo de mensajes generales
        TextArea_8      matlab.ui.control.TextArea%
        EditField_7    matlab.ui.control.EditField % Campo de entrada de anemómetros
        TextArea_7      matlab.ui.control.TextArea
        EditField_6     matlab.ui.control.EditField
        TextArea_6      matlab.ui.control.TextArea
        EditField_2     matlab.ui.control.EditField % Campo de entrada general
        EditField       matlab.ui.control.EditField
        TextArea_4      matlab.ui.control.TextArea
        TextArea_3      matlab.ui.control.TextArea
        TextArea_2      matlab.ui.control.TextArea
        cmAguaButton_2  matlab.ui.control.Button
        cmAguaButton    matlab.ui.control.Button
        SinAguaButton   matlab.ui.control.Button
        ProgramButton   matlab.ui.control.Button
        Image           matlab.ui.control.Image
        TextArea        matlab.ui.control.TextArea
    

    end

    
    % Variables internas
    properties (Access = private)
        Velocidades     double  % Matriz de velocidades seleccionada
        configuraciones struct  % Estructura para almacenar los datos de la calibración
        rutas_anemometros = {}; % Almacenamiento de rutas ingresadas
        config_coeficientes struct
    end

    % Callbacks que manejan la interacción de los componentes
    methods (Access = private)

        %definimos la funcion para resetaurar
        function resetButtonColors(app)
            % restauramos los colores de los botones a su estado inicial
            defaultColor = [0.94, 0.94, 0.94]; % Color gris claro 
            app.SinAguaButton.BackgroundColor = defaultColor;
            app.cmAguaButton.BackgroundColor = defaultColor;
            app.cmAguaButton_2.BackgroundColor = defaultColor;
            app.EditField.BackgroundColor = defaultColor;
            app.EditField_2.BackgroundColor = defaultColor;
            app.EditField_7.BackgroundColor = defaultColor;
            app.SaveButton.BackgroundColor = defaultColor;
        end

        %Creamos funciones para hacer el cambio de estado de los campo
        %es decir cuando el usuario ingresa una cadena
        function onEditFieldValueChanged(app, ~)
            % cambia el color de fondo del EditField al presionar "Enter"
            app.EditField.BackgroundColor = [0.6, 0.98, 0.6]; % Verde claro
            %app.EditField_2.BackgroundColor = [0.6, 0.98, 0.6]; % Verde claro
            %app.EditField_7.BackgroundColor = [0.6, 0.98, 0.6]; % Verde claro
        end


        % Botón "Sin Agua"
        function SinAguaButtonPushed(app, ~, ~)
                app.Velocidades = [    
    [0.81,1.110427,1.248786,1.411,1.778,2.145,2.512,2.879,3.246,3.613];
    [0.91,1.21988,1.36314,1.5311,1.9111,2.2911,2.6711,3.0511,3.4311,3.8111];
    [0.90,1.225952,1.373736,1.547,1.939,2.331,2.723,3.115,3.507,3.899];
    [0.92,1.227189,1.366302,1.5294,1.8984,2.2674,2.6364,3.0054,3.3744,3.7434];
    [0.87,1.167846,1.305828,1.4676,1.8336,2.1996,2.5656,2.9316,3.2976,3.6636];
    [0.74,1.018154,1.144072,1.2917,1.6257,1.9597,2.2937,2.6277,2.9617,3.2957];
    [0.71,0.981125,1.10365,1.2473,1.5723,1.8973,2.2223,2.5473,2.8723,3.1973];
    [0.64,0.8845,0.9976,1.1302,1.4302,1.7302,2.0302,2.3302,2.6302,2.9302]
    ];
    %cambiamos de color del boton, para mostrar un cambio y mostramos el
    %ultimo estado
    app.resetButtonColors(); % Resetea los colores de todos los botones
    app.SinAguaButton.BackgroundColor = [0.6, 0.98, 0.6];
    % Cambiar la imagen según la configuración seleccionada
    app.Image.ImageSource = 'images/Malla_SA_ejecutable.svg';  % Ruta de la imagen para "Sin Agua"
    disp(app.Velocidades);
    %uialert(app.UIFigure, 'Debes ingresar 10 mediciones de Humedad, Temperatura y Presión', 'Información', 'Icon', 'info');
    app.TextArea_8.Value = {
        'Posiciones:' 
        '(0,10), (0,20), (0,30), (0,40), (0,45), (0,65), (0,70), (0,80)';
        'Potencias:' 
        'Derecho: 30%, 40%, 45%' 
        'Ambos: 40%, 50%, 60%, 70%, 80%, 90%, 100%'
        
    };
         pause(.5); 
        uialert(app.UIFigure, 'Configuracion: "Sin Agua"                                                    Los datos de los 10 archivos deben contener las señales Vb y Vc e.g                                                                                 | -- | Channel_013 (Vb) | -- | Channel_014 (Vc) |', 'Información', 'Icon', 'info');
        end

        % Botón "20 cm Agua"
        function cmAguaButtonPushed(app, ~, ~)
                app.Velocidades = [
    [0.827836,1.168323,1.524896,1.860404,2.21,2.523377,2.7459,3.1289,3.3204,3.5119,3.8949];
    [0.888,1.2436,1.616,1.9664,2.33,2.6588,2.8912,3.2912,3.4912,3.6912,4.0912];
    [0.905008,1.259719,1.631188,1.980712,2.34,2.671381,2.9032,3.3022,3.5017,3.7012,4.1002];
    [0.876456,1.203608,1.546216,1.868584,2.20,2.505592,2.7194,3.0874,3.2714,3.4554,3.8234];
    [0.871736,1.189998,1.523296,1.836904,2.16,2.456602,2.6646,3.0226,3.2016,3.3806,3.7386];
    [0.816764,1.120802,1.439204,1.738796,2.05,2.330798,2.5295,2.8715,3.0425,3.2135,3.5555]    
            ];
    %cambiamos de color del boton, para mostrar un cambio
    app.resetButtonColors(); % Resetea los colores de todos los botones
    app.cmAguaButton.BackgroundColor = [0.6, 0.98, 0.6];
    % Cambiar la imagen según la configuración seleccionada
    app.Image.ImageSource = 'images/Malla_20cm_ejecutable.svg';  % Ruta de la imagen para "Sin Agua"
    disp(app.Velocidades);

        app.TextArea_8.Value = {
        'Posiciones:' 
        '(0,30), (0,40), (0,45), (0,65), (0,70), (0,80)';
        'Potencias:' 
        'Derecho: 30%, 40%, 50%, 60%, 70%, 80%' 
        'Ambos: 70%, 80%, 85%, 90%, 100%'

        };
         pause(.5); 
        uialert(app.UIFigure, 'Configuracion: "20 cm de Agua"                                           Los datos de los 11 archivos deben contener las señales Vb y Vc e.g                                                                                 | -- | Channel_013 (Vb) | -- | Channel_014 (Vc) |', 'Información', 'Icon', 'info');
        end

        % Botón "30 cm Agua"
        function cmAguaButton_2Pushed(app, ~, ~)
                app.Velocidades = [
    [0.889119,1.253168,1.597367,1.960622,2.293308,2.658151,2.9031,3.3001,3.4986,3.6971,4.0941];
    [0.891397,1.268284,1.624621,2.000686,2.345104,2.722813,2.9764,3.3874,3.5929,3.7984,4.2094];
    [0.908654,1.277288,1.625822,1.993652,2.330528,2.699966,2.948,3.35,3.551,3.752,4.154];
    [0.910338,1.271636,1.613234,1.973744,2.303916,2.666002,2.9091,3.3031,3.5001,3.6971,4.0911];
    [0.88113,1.23876,1.57689,1.93374,2.26056,2.61897,2.8596,3.2496,3.4446,3.6396,4.0296]    
            ];
    %cambiamos de color del boton, para mostrar un cambio
    app.resetButtonColors(); % Resetea los colores de todos los botones
    app.cmAguaButton_2.BackgroundColor = [0.6, 0.98, 0.6];
    % cambiar la imagen según la configuración seleccionada
    app.Image.ImageSource = 'images/Malla_30cm_ejecutable.svg';  % Ruta de la imagen para "Sin Agua"
    
    disp(app.Velocidades);
    %uialert(app.UIFigure, 'Debes ingresar 11 mediciones de Humedad, Temperatura y Presión', 'Información', 'Icon', 'info');
        app.TextArea_8.Value = {
        'Posiciones:' 
        '(0,40), (0,45), (0,65), (0,70), (0,80)';
        'Potencias:' 
        'Derecho: 30%, 40%, 50%, 60%, 70%, 80%' 
        'Ambos: 70%, 80%, 85%, 90%, 100%'

        };
         pause(.5); 
        uialert(app.UIFigure, 'Configuracion: "30 cm de Agua"                                           Los datos de los 11 archivos deben contener las señales Vb y Vc e.g                                                                                 | -- | Channel_013 (Vb) | -- | Channel_014 (Vc) |', 'Información', 'Icon', 'info');
        end
         
function Programa(app)
    % capturamos las posiciones
    posiciones_input = app.EditField.Value;
    disp(['Posiciones ingresadas: ', posiciones_input]);

    % validacion de los datos
    if isempty(posiciones_input)
        uialert(app.UIFigure, 'Ingresa las posiciones.', 'Error');
        return;
    end

    % Obtenemos el número de filas en la matriz de velocidades
    [num_filas, ~] = size(app.Velocidades);

    % filtramos la confi seleccionada
    if num_filas == 8
        coordenadas = ["(0,10)", "(0,20)", "(0,30)", "(0,40)", "(0,45)", "(0,65)", "(0,70)", "(0,80)"];
        disp('Configuración: Sin Agua');

    elseif num_filas == 6
        coordenadas = ["(0,30)", "(0,40)", "(0,45)", "(0,65)", "(0,70)", "(0,80)"];
        disp('Configuración: 20 cm Agua');

    elseif num_filas == 5
        coordenadas = ["(0,40)", "(0,45)", "(0,65)", "(0,70)", "(0,80)"];
        disp('Configuración: 30 cm Agua');

    else
        uialert(app.UIFigure, 'Número de filas no reconocido.', 'Advertencia', 'Icon', 'warning');
        drawnow;
        return;
    end

    % extraer las coordenadas ingresadas por el usuario con regex
    posiciones = regexp(posiciones_input, '\([0-9]+,[0-9]+\)', 'match');
    if isempty(posiciones)
        uialert(app.UIFigure, 'Coordenada inválida.', 'Error');
        disp('No se encontraron coordenadas válidas en la entrada.');
        return;
    end

    disp('Coordenadas extraídas:');
    disp(posiciones);

    % Buscamos las filas correspondientes
    filas_selec_V_LDA = [];
    for i = 1:length(posiciones)
        idx = find(strcmp(coordenadas, posiciones{i}));
        if isempty(idx)
            uialert(app.UIFigure, "Error: La coordenada " + posiciones{i} + " no es válida.", 'Error');
            drawnow;
            disp(['Coordenada inválida o fuera de rango: ', posiciones{i}]);
        else
            filas_selec_V_LDA = [filas_selec_V_LDA; app.Velocidades(idx, :)];
        end
    end

    % mostrar las filas seleccionadas
    if isempty(filas_selec_V_LDA)
        disp('No se seleccionaron filas válidas.');
    else
        disp('Filas seleccionadas:');
        disp(filas_selec_V_LDA);
    end    

    % abrir la ventana de las rutas
    ruta = uigetdir(pwd, 'Selecciona la carpeta de archivos');
    
    % Validar que se haya seleccionado una ruta
    if ruta == 0
        uialert(app.UIFigure, 'No se seleccionó ninguna ruta.', 'Advertencia', 'Icon', 'warning');
        return;
    else
        % mostrar la ruta seleccionada en EditField_2
        app.EditField_2.Value = ruta;
        
        % agregar la ruta a la lista
        if ~isfield(app, 'rutas_anemometros') || isempty(app.rutas_anemometros)
            app.rutas_anemometros = {};
        end
        app.rutas_anemometros = [app.rutas_anemometros; {ruta}];
        
        % mostrar todas las rutas ingresadas en TextArea_12
        texto_rutas = strjoin(app.rutas_anemometros, '\n');
        app.TextArea_12.Value = texto_rutas;
    end

    % guardamos las rutas medianye archivo .mat
    rutas_anemometros = app.rutas_anemometros;
    save('rutas_archivos_anemometros.mat', 'rutas_anemometros');
    uialert(app.UIFigure, 'Direcciones guardadas correctamente', 'Información', 'Icon', 'info');
    drawnow;

    % Procesar señales
    processAnemometerSignals(app, filas_selec_V_LDA, posiciones, num_filas);
    disp("Procesamiento completo :)");
end



        %function processAnemometerSignals(app, filas_selec_V_LDA, posiciones, configuraciones, nombre_archivo)
        function processAnemometerSignals(app, filas_selec_V_LDA, posiciones,num_filas);
            if isempty(app.rutas_anemometros)
                app.TextArea_10.Value = "No hay rutas disponibles para procesar.";
                return;
            end
            [X_espartan, X_espartan_prom,Visc, Visc_prom,T_W,T_A] = Senales_Anemo(app, app.rutas_anemometros);
            disp("Señales X :)");
            save('resultados_anemometros.mat', 'X_espartan', 'X_espartan_prom','Visc','Visc_prom','T_W','T_A');


            %Invocamos a la funcion Procesamiento_X
            [CP, V_Ane_prom, V_Ane_com, Desv_V_Ane, Re_sensor,Viscosidad_Prom,Re_prom_cal] = Procesamiento_X(app, filas_selec_V_LDA, num_filas, X_espartan_prom, X_espartan,Visc, Visc_prom,T_W,T_A)

            %Guardamos las salidas en un archivo txt

            %Determinar la configuración según el número de filas
            
            configuraciones = struct();
            if num_filas == 8
                nombre_config = "Sin_Agua";
            elseif num_filas == 6
                nombre_config = "Agua_20cm";
            elseif num_filas == 5
                nombre_config = "Agua_30cm";
            else
                error('Número de filas no válido. Intente con 8, 6 o 5.');
            end
            
            % creamos la configuración que usaremos al exportar como txt
            configuraciones.(nombre_config) = struct( ...
            'Posiciones', {posiciones}, ...
            'FilasSeleccionadas', {filas_selec_V_LDA}, ...
            'X_espartan_prom', {X_espartan_prom}, ...
            'Coeficientes', {CP}, ...
            'Velocidad_Promedio', {V_Ane_prom}, ...
            'Velocidad_desviacion', {Desv_V_Ane}, ...
            'Reynolds_Sensor', {Re_sensor} ...
            );
            %ahora hacemos una estructura individual para extraer cada
            %uno de los coeficientes del ajuste de cada anemometro
            config_coeficientes = struct();
            config_coeficientes = struct('Coeficientes_Ane', {CP});

             app.configuraciones = configuraciones;
             disp("Configuraciones guardadas");
             disp(configuraciones);
                
             app.config_coeficientes = config_coeficientes;
             disp("Señal individual X promedio");
             disp(config_coeficientes);
        end


        %------------------------Declaramos la funcion para procesar las ruta
        
        function [X_espartan, X_espartan_prom,Visc, Visc_prom,T_W,T_A] = Senales_Anemo(app, rutas_anemometros)
            % Inicializamos las variables de salida
            disp("Procesando señales de anemómetros...");
            X_espartan = {};
            X_espartan_prom = {};
            Visc = {};
            Visc_prom = {};
        
            for ruta_idx = 1:length(rutas_anemometros)
                Ruta_Espartan = strtrim(rutas_anemometros{ruta_idx});
        
                % mensaje solicitando la cantidad de sensores
                app.TextArea_10.Value = sprintf("Cantidad de sensores para la carpeta %s:", Ruta_Espartan);
                app.EditField_7.Value = ''; 
        
                waitfor(app.EditField_7, 'Value'); % esperar a que el usuario ingrese el dato
                num_sensores = app.EditField_7.Value; % obtener el valor del usuario
                n = str2double(num_sensores);
        
                % validacion de entrada del usuario
                if isnan(n) || n <= 0
                    app.TextArea_10.Value = "Entrada inválida. Ingresa un número válido.";
                    continue; % saltar al siguiente ciclo
                end
        
                % agregar al historial
                historial_actual = app.TextArea_13.Value;
                if ischar(historial_actual)
                    historial_actual = {historial_actual};
                end
                app.TextArea_13.Value = [historial_actual; ...
                    sprintf("Carpeta: %s, Sensores: %d", Ruta_Espartan, n)];
        
                % procesamiento de losarchivos en la carpeta
                archivos = dir(fullfile(Ruta_Espartan, '*.TXT'));
                n_archivos = length(archivos);
        
                % inicializar celdas 
                X_espartan_temp = cell(1, n);
                X_espartan_prom_temp = cell(1, n);
                VB = cell(1, n);
                VC = cell(1, n);
                k = cell(1, n);
                Tw = cell(1, n);
                Ta = cell(1, n);
                Viscosidad = cell(1, n);
                Viscosidad_prom = cell(1, n);
        
                % ordenaminento de los archivos por folio
                folios = zeros(1, n_archivos);
                for i = 1:n_archivos
                    nombre = archivos(i).name;
                    folio = sscanf(nombre, '%d');
                    folios(i) = folio;
                end
        
                [~, idx] = sort(folios);
                archivos_ordenados = archivos(idx);
        
                % lectura y procesamiento  de los archivos
                for i = 1:n_archivos
                    archivo_actual = archivos_ordenados(i).name;
                    data_V_BCX = importdata(fullfile(Ruta_Espartan, archivo_actual));
        
                    for j = 1:n
                        %unicamente para señales Vb, Vc
                        
                        VB{j}(:, i) = data_V_BCX.data(:, 4*j-2);  % 2,6,10,...
                        VC{j}(:, i) = data_V_BCX.data(:, 4*j);    % 4,8,12,...
                        ratio = VB{j} ./ VC{j} - 1;
                        % temperaturas
                        Tw{j} = 4499.61 .* (13.0334 - log(ratio)).^(-1); %en K 
                        Ta{j} = 3350.33 .* (11.2360 - log(ratio)).^(-1);
                        % conductividad térmica k
                        k{j} = 4.988e-3 + 7.140e-5 .* ((Tw{j} + Ta{j}) ./ 2);
                        Viscosidad{j} =9.6992e-8 .*((Tw{j} + Ta{j})./2)-1.3020e-5; % m^2 /s viscosidad cinematica
                        Viscosidad_prom{j}(i) = mean(Viscosidad{j}(:, i), 'omitnan');
                        X_espartan_temp{j} = (1.634 ./ k{j}) .* (VC{j} .* (VB{j} - VC{j}) ./ (Tw{j} - Ta{j})); 
                        X_espartan_prom_temp{j}(i) = mean(X_espartan_temp{j}(:, i), 'omitnan');
                    end
                end
        
                % resultados temporales
                X_espartan{ruta_idx} = X_espartan_temp;
                X_espartan_prom{ruta_idx} = X_espartan_prom_temp;
                Visc{ruta_idx} = Viscosidad;
                Visc_prom{ruta_idx} = Viscosidad_prom ;
                T_W{ruta_idx} = Tw;
                T_A{ruta_idx} = Ta;
            end
            uialert(app.UIFigure, 'Sensores ingresados, procesando señales', 'Información', 'Icon', 'info');
            disp(size(X_espartan_prom));
            disp(size(X_espartan_prom{1}));
            

        end

%---------------------------------

%----------------- Llamamos a la funcion procesamiento_X esta sen encarga
%de hacer la calibracion de cada anemometro, es decir obtenemos los
%coeficientes:)

function [CP, V_Ane_prom, V_Ane_com, Desv_V_Ane, Re_sensor,Viscosidad_Prom,Re_prom_cal] = Procesamiento_X(app,filas_selec_V_LDA, num_filas, X_espartan_prom, X_espartan,Visc, Visc_prom,T_W,T_A)
            % Procesamiento de la señal X para cada punto seleccionado.
            disp("Es necesario tener la señal X para todas las potencias de las posiciones seleccionadas.");
            disp("Debes crear una carpeta con todas las señales X para cada punto.");
            disp("Debes ingresar los archivos en el mismo orden que seleccionaste los puntos caracterizados.");
        
            % Inicializacion de resultados
            num_filas = size(filas_selec_V_LDA, 1);  % numero de filas a procesar
            CP = cell(num_filas, 1);  % Coeficientes de los ajustes 
            V_Ane_prom = cell(num_filas, 1);  % Velocidad promedio
            V_Ane_com = cell(num_filas, 1);  % Velocidad completa
            Desv_V_Ane = cell(num_filas, 1);  % Desviación estandar
            Re_sensor = cell(num_filas, 1);  % Reynolds promedio
            d = 3e-4;  % diametro en metros
            Re_prom_cal = cell(num_filas, 1);  % Reynolds completo
        

            for i = 1:num_filas
                % Señales X para la fila actual
                disp("filas");
                disp(num_filas);
                X_Temp = X_espartan_prom{1, 1}{1,i};  % señal promedio
                disp("Señal X prom");
                disp(X_Temp)
                X_Temp_Comp = X_espartan{1, 1}{1,i};  % señal completa
                Viscosidad_Temp = Visc{1,1}{1,i};
                Viscosidad_Prom = Visc_prom{1,1}{1,i};
                Re_prom_cal{i} = filas_selec_V_LDA(i,:) .* (d./Viscosidad_Prom);
         
                % ajuste poli de cuarto grado
                [p, S] = polyfit(X_Temp, Re_prom_cal{i}, 4);% grfica x en terminos de reynolds
                %y a esa curva hacemos el ajuste 4to
                disp("Coeficientes");
                CP{i} = p;
                disp(CP{i});
        
                % Evaluamos el polinomio para la señal original
                y_fit_original = polyval(p, X_Temp);
                % Calculo del coeficiente de determinación R^2
                y_mean = mean(Re_prom_cal{i});
                SST = sum((Re_prom_cal{i} - y_mean).^2);  % Suma total de cuadrados
                SSR = sum((Re_prom_cal{i} - y_fit_original).^2);  % Suma de residuos
                R2 = 1 - (SSR / SST);
                
                fprintf('Fila %d - Coeficiente de determinación R^2: %.4f\n', i, R2);
                % Velocidad completa y desviación
                Re_sensor{i} = polyval(p, X_Temp);  
                V_Ane_com{i} = (3.2330e-4.*((T_W{1,1}{1,i} + T_A{1,1}{1,i})./2)- 0.0434).*polyval(p, X_Temp_Comp);
                Desv_V_Ane{i} = std(V_Ane_com{i}, 0, 1);
                V_Ane_prom{i} = mean(V_Ane_com{i});
            end
        end
%-----------------
        % Función callback que maneja la lógica del botón Guardar
        function SaveButtonPushed(app)
            % nombre del archivo
            nombre_archivo = app.EditField_6.Value;
        
            % validar  el nombre 
            if isempty(nombre_archivo)
                uialert(app.UIFigure, 'Por favor, ingresa un nombre para el archivo.', 'Error');
                return;
            end
        
            % agregar la extensión '.txt' sino la tiene
            if ~endsWith(nombre_archivo, '.txt')
                nombre_archivo = strcat(nombre_archivo, '.txt');
            end

                %-------------
                
            % abrir ventana para seleccionar ubicación y nombre del archivo
            [file, path] = uiputfile('*.txt', 'Guardar archivo como', nombre_archivo);
            
            % verificar si el usuario selecciono o no la ruta
            if isequal(file, 0) || isequal(path, 0)
                disp('El usuario canceló la operación de guardar.');
                return;
            end
            
            % ruta completa del archivo
            fullFileName = fullfile(path, file);
            
            % invocar a la función Exportar

            Exportar(app, app.configuraciones,app.config_coeficientes,fullFileName);
        end
        %--------
        function Exportar(app, configuraciones, config_coeficientes, fullFileName)
            % abrimos el archivo para escribir
            fid = fopen(fullFileName, 'w');
            if fid == -1
                error('No se pudo abrir el archivo para escritura.');
            end
        
            % nombres de los campos de la estructura
            nombres_configuraciones = fieldnames(configuraciones);
        
            
            for i = 1:length(nombres_configuraciones)
                % nombre de la configuración
                nombre_config = nombres_configuraciones{i};
        

                fprintf(fid, 'Lord Comandante Gansito Company ;v\n');
                fprintf(fid, 'Configuración: %s\n', nombre_config);
                fprintf(fid, '\n');
                fprintf(fid, 'Canales virtuales para las mediciones con anemometros calibrados: Tw, Ta, k, X, V  \n');
                fprintf(fid, 'Tw = 4499.61(13.0334 - ln(Vb/Vc - 1))^(-1) \n');
                fprintf(fid, 'Ta = 3350.33(11.2360 - ln(Vb/Vc - 1))^(-1) \n');
                fprintf(fid, 'k = 4.988e−3 + 7.140e-5((Tw+Ta)/2)   \n');
                fprintf(fid, 'X = (1.634/k)(VC(VB - VC))/(Tw - Ta) e.g \n');
                fprintf(fid, 'Re(X) = C_5*(X)^5 + C_4*(X)^4 + C_3*(X)^3 + C_2*(X)^2 + C_1*(X) + C_0 \n');
                fprintf(fid, 'V = (3.2330e-4((Tw+Ta)/2) - 0.0434)Re(X) \n');
                fprintf(fid, '\n');
                fprintf(fid, '\n');
                
                %exportamos cada uno de los resultados
                %---------------------------
                % accedemos a la subestructura
                subestructura = configuraciones.(nombre_config);
                nombres_campos = fieldnames(subestructura);
        
                % recorremos cada uno delos campos 
                for j = 1:length(nombres_campos)
                    nombre_campo = nombres_campos{j};
                    valor_campo = subestructura.(nombre_campo);
                    
                    % escribimos el nombre del campo
                    fprintf(fid, '\t%s:\n', nombre_campo);
                    
                    % ahora accedemos a los valores segun su tipo
                    if ischar(valor_campo) || isstring(valor_campo)
                        % Caso 1: si es texto
                        fprintf(fid, '\t\t%s\n', valor_campo);
                    
                    elseif isnumeric(valor_campo)
                        % Caso 2: si es un número o matriz numerica
                        if isvector(valor_campo)
                            fprintf(fid, '\t\t%s\n', mat2str(valor_campo));
                        else
                            fprintf(fid, '\t\t[\n');
                            for fila = 1:size(valor_campo, 1)
                                fprintf(fid, '\t\t\t%s\n', mat2str(valor_campo(fila, :)));
                            end
                            fprintf(fid, '\t\t]\n');
                        end
                    
                    elseif iscell(valor_campo)
                        % Caso 3: Si es una celda
                        if isequal(nombre_campo, 'X_espartan_prom')
                            % Caso especial para X_espartan_prom
                            fprintf(fid, '\t\t{\n');
                            for k = 1:numel(valor_campo)
                                subvalor = valor_campo{k};
                                if iscell(subvalor)
                                    fprintf(fid, '\t\t\t{\n');
                                    for l = 1:numel(subvalor)
                                        subsubvalor = subvalor{l};
                                        if isnumeric(subsubvalor)
                                            fprintf(fid, '\t\t\t\t%s\n', mat2str(subsubvalor));
                                        elseif ischar(subsubvalor) || isstring(subsubvalor)
                                            fprintf(fid, '\t\t\t\t%s\n', subsubvalor);
                                        else
                                            fprintf(fid, '\t\t\t\t(Dato no soportado)\n');
                                        end
                                    end
                                    fprintf(fid, '\t\t\t}\n');
                                elseif isnumeric(subvalor)
                                    fprintf(fid, '\t\t\t%s\n', mat2str(subvalor));
                                else
                                    fprintf(fid, '\t\t\t(Dato no soportado)\n');
                                end
                            end
                            fprintf(fid, '\t\t}\n');
                        else
                            % Caso general para celdas
                            fprintf(fid, '\t\t{\n');
                            for k = 1:numel(valor_campo)
                                subvalor = valor_campo{k};
                                if isnumeric(subvalor)
                                    fprintf(fid, '\t\t\t%s\n', mat2str(subvalor));
                                elseif ischar(subvalor) || isstring(subvalor)
                                    fprintf(fid, '\t\t\t%s\n', subvalor);
                                else
                                    fprintf(fid, '\t\t\t(Dato no soportado)\n');
                                end
                            end
                            fprintf(fid, '\t\t}\n');
                        end
                    else
                        % Caso 4: casos sin considerar
                        fprintf(fid, '\t\t(Dato no soportado)\n');
                    end
                end
                
                fprintf(fid, '\n');
                %-------------------------------
                %Imprimimos la ecuacion con los coeficientes para cada una
                %de las celdas
                % Accedemos a los coeficientes de config_coeficientes
                coeficientes_ane = config_coeficientes.Coeficientes_Ane;
        
                % generamos las ecuaciones para cada celda
                for l = 1:numel(coeficientes_ane)
                    coeficientes = coeficientes_ane{l}; % accedemos a los coeficientes de la celda l
        
                    
                    if numel(coeficientes) == 5
                        % Generamos la ecuación para Reynolds_n
                        ecuacion = sprintf('Re(X)_%d = %.5f*(X%d)^4 + %.5f*(X%d)^3 + %.5f*(X%d)^2 + %.5f*(X%d) + %.5f', ...
                            l, coeficientes(1), l, coeficientes(2), l, coeficientes(3), l, coeficientes(4), l, coeficientes(5));
        
                        % escribir la ecuacion en el archivo
                        fprintf(fid, '\t%s\n', ecuacion);
                    else
                        fprintf(fid, '\tError: Los coeficientes para la celda %d no tienen el formato esperado.\n', l);
                    end
                end
        
                
                fprintf(fid, '\n');
            end
        
            % cerrar el archivo
            fclose(fid);
            disp(['Archivo exportado exitosamente como: ', fullFileName]);
            uialert(app.UIFigure, 'Archivo exportado exitosamente.', 'Información', 'Icon', 'info');
        end
        
    end

    % Inicializar componentes de la interfaz
    methods (Access = private)
        function createComponents(app)
            % Crear la ventana principal
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.651 0.651 0.651];
            app.UIFigure.Position = [100 100 1314 566];
            app.UIFigure.Name = 'Calibración de Anemometros Recargado :v';
            app.UIFigure.Resize = 'off'; %Fijar el tamaño de la ventana

             % Create TextArea
            app.TextArea = uitextarea(app.UIFigure);
            app.TextArea.HorizontalAlignment = 'center';
            app.TextArea.FontWeight = 'bold';
            app.TextArea.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea.Position = [164 515 312 28];
            app.TextArea.Value = {'  Selecciona la configuracion deseada del canal:       '; ''};
            app.TextArea.Editable = 'off';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [30 -14 575 530];

            % Crear botón "Sin Agua"
            app.SinAguaButton = uibutton(app.UIFigure, 'push');
            app.SinAguaButton.Position = [176 478 73 23];
            app.SinAguaButton.Text = 'Sin Agua';
            app.SinAguaButton.ButtonPushedFcn = @(~, ~) app.SinAguaButtonPushed();

            % Crear botón "20 cm Agua"
            app.cmAguaButton = uibutton(app.UIFigure, 'push');
            app.cmAguaButton.Position =  [280 478 77 23];
            app.cmAguaButton.Text = '20 cm Agua';
            app.cmAguaButton.ButtonPushedFcn = @(~, ~) app.cmAguaButtonPushed();

            % Crear botón "30 cm Agua"
            app.cmAguaButton_2 = uibutton(app.UIFigure, 'push');
            app.cmAguaButton_2.Position = [383 478 79 23];
            app.cmAguaButton_2.Text = '30 cm Agua';
            app.cmAguaButton_2.ButtonPushedFcn = @(~, ~) app.cmAguaButton_2Pushed();

            % Create TextArea_2
            app.TextArea_2 = uitextarea(app.UIFigure);
            app.TextArea_2.HorizontalAlignment = 'center';
            app.TextArea_2.FontWeight = 'bold';
            app.TextArea_2.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_2.Position = [734 504 481 35];
            app.TextArea_2.Value = {'Procura utilizar anemometros calibrados con intervalos similares de velocidad'};
            app.TextArea_2.Editable = 'off';
            

            % Create TextArea_3
            app.TextArea_3 = uitextarea(app.UIFigure);
            app.TextArea_3.HorizontalAlignment = 'center';
            app.TextArea_3.FontWeight = 'bold';
            app.TextArea_3.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_3.Position = [640 266 305 41];
            app.TextArea_3.Value = {'Rutas de las carpetas de las señales X del punto seleccionado'};
            app.TextArea_3.Editable = 'off';
            
            % Create TextArea_4
            app.TextArea_4 = uitextarea(app.UIFigure);
            app.TextArea_4.HorizontalAlignment = 'center';
            app.TextArea_4.FontWeight = 'bold';
            app.TextArea_4.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_4.Position = [769 358 388 40];
            app.TextArea_4.Value = {'             Ingresa los puntos caracterizados que desees,                     e.g (0,10), (0,20) ... (0,80)'};
            app.TextArea_4.Editable = 'off';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'text');
            app.EditField.Position = [769 322 271 22];
            app.EditField.ValueChangedFcn = @(~, ~) onEditFieldValueChanged(app);
            app.EditField.Placeholder = 'e.g (0,10), (0,45)';
            
            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'text');
            app.EditField_2.Position = [640 100 304 28];
            app.EditField_2.ValueChangedFcn = @(~, ~) onEditFieldValueChanged(app);
            app.EditField_2.Value = '';
            app.EditField_2.Placeholder = 'e.g: /Users/lordchuy/Desktop';

            % Create TextArea_6
            app.TextArea_6 = uitextarea(app.UIFigure);
            app.TextArea_6.HorizontalAlignment = 'center';
            app.TextArea_6.FontWeight = 'bold';
            app.TextArea_6.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_6.Position =  [784 59 360 28];
            app.TextArea_6.Value = {'Nombra el archivo de texto de tu calibracion'};
            app.TextArea_6.Editable = 'off';

            % Create EditField_6
            app.EditField_6 = uieditfield(app.UIFigure, 'text');
            app.EditField_6.Position = [805 20 209 22];
            app.EditField_6.Value = '';
            app.EditField_6.Placeholder = 'archivo.txt';

            % Create TextArea_7
            app.TextArea_7 = uitextarea(app.UIFigure);
            app.TextArea_7.HorizontalAlignment = 'center';
            app.TextArea_7.FontWeight = 'bold';
            app.TextArea_7.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_7.Position =  [980 266 311 41];
            app.TextArea_7.Value = {'Cantidad de anemometros en cada ruta'};
            app.TextArea_7.Editable = 'off';
            
            % Create EditField_7
            app.EditField_7 = uieditfield(app.UIFigure, 'text');
            app.EditField_7.Position = [980 100 311 28];
            app.EditField_7.Value = '';

            % Create TextArea_8
            app.TextArea_8 = uitextarea(app.UIFigure);
            app.TextArea_8.HorizontalAlignment = 'left';
            app.TextArea_8.FontWeight = 'bold';
            app.TextArea_8.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_8.Position = [769 408 388 81];
            app.TextArea_8.Value = {''};%mensajes del campo de posiciones
            app.TextArea_8.Editable = 'off';  % desactiva la edicion

            % Create TextArea_9
            app.TextArea_9 = uieditfield(app.UIFigure,'text');
            app.TextArea_9.HorizontalAlignment = 'center';
            app.TextArea_9.FontWeight = 'bold';
            app.TextArea_9.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_9.Position = [640 224 305 43];
            app.TextArea_9.Value = '';%celda de preguntas de las rutas X
            app.TextArea_9.Editable = 'off';

            % Create TextArea_10
            app.TextArea_10 = uieditfield(app.UIFigure,'text');
            app.TextArea_10.HorizontalAlignment = 'center';
            app.TextArea_10.FontWeight = 'bold';
            app.TextArea_10.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_10.Position =  [980 224 311 43];
            app.TextArea_10.Value = '';%celda de cantidad de anemometros
            app.TextArea_10.Editable = 'off';

            % Boton para guardar
            app.SaveButton = uibutton(app.UIFigure, 'push');
            % posicion y texto del boton
            app.SaveButton.Position = [1029 20 100 23];
            app.SaveButton.Text = 'Guardar';
            % funcion que se ejecuta cuando presionan el boton
            app.SaveButton.ButtonPushedFcn = @(src, event) SaveButtonPushed(app);
            
            % Create TextArea_12
            app.TextArea_12 = uitextarea(app.UIFigure);
            app.TextArea_12.HorizontalAlignment = 'center';
            app.TextArea_12.FontWeight = 'bold';
            app.TextArea_12.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_12.Position = [640 141 305 84];
            app.TextArea_12.Value = {'historial ubicaciones'};
            app.TextArea_12.Editable = 'off';

            % Create TextArea_13
            app.TextArea_13 = uitextarea(app.UIFigure);
            app.TextArea_13.HorizontalAlignment = 'center';
            app.TextArea_13.FontWeight = 'bold';
            app.TextArea_13.BackgroundColor = [0.8 0.8 0.8];
            app.TextArea_13.Position = [980 141 311 84];
            app.TextArea_13.Value = {'historial cantidad'};
            app.TextArea_13.Editable = 'off';
            % Crear boton para ejecutar programa

            app.ProgramButton = uibutton(app.UIFigure, 'push');
            app.ProgramButton.Position =  [1057 322 100 23];
            app.ProgramButton.Text = 'Ejecutar';
            app.ProgramButton.ButtonPushedFcn = @(~, ~) app.Programa();
            % Mostrar la ventana
            app.UIFigure.Visible = 'on';


        end
    end
    

    % Construir y eliminar la aplicación
    methods (Access = public)
        function app = Calibrador_Recharged
            createComponents(app);
            registerApp(app, app.UIFigure);
            app.UIFigure.Visible = 'on';
            % if nargout == 0
            %     clear app
            % end
        end

        function delete(app)
            delete(app.UIFigure);
        end
    end
end
