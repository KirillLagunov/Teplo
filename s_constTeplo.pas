unit s_constTeplo;

interface
 var
   patch_app,
   patch_base : string;

 //--------------------------UserConst
  id_roul_user,
  fio_user,
  id_user : string;
 //-----------------------------------

 //--------------------------AppConst
  id_session_in_file,
  visitor_action,
  minute_user_visit,
  pay_user_visit,
  paysale_user_visit,
  end_user_visit,
  first_hour_pay,
  one_minute_pay,
  edit_user_value,
  edit_login_user,
  id_current_session : string;
 //----------------------------------

 const
   PSWDBASE='Teplo51';
   APPVER='1.1.1';
   APPTITLE='�������� "�����!"';
   ERRORDBCONNECTED='������ ���������� � ����� ������';
   ERRORDBUSERNOTFOUND='��� ������������ ��� ������ ������ �������';
   ERRORDBCREATEUSER='������ ������������ ��� ���� � �������';
   ACCEPTUSERCHANGEPWD='������ ������� �������';
   ERRORUSERCHANGEPWD='������ �� �������';
   ERRORADDVISITORINSESSION='������������ ��� ���� � ������ �� ���������';
   ADMIDROUL='2';
   
implementation

end.
