InitBreach;
fuel_inj_tol = 1.0; 
MAF_sensor_tol = 1.0;
AF_sensor_tol = 1.0; 
pump_tol = 1.;
kappa_tol=1; 
tau_ww_tol=1;
fault_time=50;
kp = 0.04;
ki = 0.14;

% online block init

max_rob = 5;
rob_up_lim = -5;
rob_low_lim = 5;
rob_diff_lim = -inf;

phi_AFC = 'ev_[10, 30] (alw_[5,10] (abs(AF[t]-AFref[t])>1))';

subform = 'L';
diagnoser = 2;

mdl = 'AbstractFuelControl_M1';
BrAFC = BreachSimulinkSystem(mdl);

Br0 = BrAFC.copy();
pedal_angle_gen = pulse_signal_gen({'Pedal_Angle'}); % Generate a pulse signal for pedal angle
engine_gen      = fixed_cp_signal_gen({'Engine_Speed'}, ... % signal name
                                       3,...                % number of control points
                                      {'spline'});       % interpolation method 
        
InputGen = BreachSignalGen({pedal_angle_gen, engine_gen});

InputGen.SetParam({'Engine_Speed_u0','Engine_Speed_u1','Engine_Speed_u2'},...
                        [1000 1100 500]);

InputGen.SetParam({'Pedal_Angle_base_value', 'Pedal_Angle_pulse_period', ...
                         'Pedal_Angle_pulse_amp','Pedal_Angle_pulse_width'}, ... 
                         [0 15 30 .5]);
   
BrAFC.SetInputGen(InputGen);

