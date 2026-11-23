program Hasil_Studi_Mahasiswa;

uses crt;

const
    MaksMhs = 50;
    MaksMK = 20;

var
    // Array untuk menyimpan identitas mahasiswa
    nama: array[1..MaksMhs] of string;
    nim: array[1..MaksMhs] of string;

    // Array untuk menyimpan data mata kuliah
    jumlahMK: array[1..MaksMhs] of integer;
    matkul: array[1..MaksMhs,1..MaksMK] of string;
    sks: array[1..MaksMhs,1..MaksMK] of integer;
    nilai: array[1..MaksMhs,1..MaksMK] of string;

    // Array untuk menyimpan bobot nilai dan skor
    mutu: array[1..MaksMhs,1..MaksMK] of real;
    skor: array[1..MaksMhs,1..MaksMK] of real;

    // Variabel bantu
    jumlahMhs, i, j: integer;
    totalSKS: integer;
    totalSkor, IP: real;

begin
    clrscr;

    // Menampilkan judul program
    writeln('================================');
    writeln('      PROGRAM HASIL STUDI');
    writeln('================================');

    // Input jumlah mahasiswa
    write('Jumlah mahasiswa: ');
    readln(jumlahMhs);

    // Validasi jumlah mahasiswa
    while (jumlahMhs < 1) or (jumlahMhs > MaksMhs) do
    begin
        writeln('Jumlah mahasiswa harus 1-50!');
        write('Masukkan kembali: ');
        readln(jumlahMhs);
    end;

    // Perulangan input data setiap mahasiswa
    for i := 1 to jumlahMhs do
    begin
        clrscr;

        writeln('DATA MAHASISWA KE-', i);
        writeln('----------------------------');

        // Input identitas mahasiswa
        write('Nama: ');
        readln(nama[i]);

        write('NIM: ');
        readln(nim[i]);

        // Input jumlah mata kuliah
        write('Jumlah mata kuliah:  ');
        readln(jumlahMK[i]);

        // Validasi jumlah mata kuliah
        while (jumlahMK[i] < 1) or
                (jumlahMK[i] > MaksMK) do
        begin
            writeln('Jumlah mata kuliah harus 1-20!');
            write('Masukkan kembali: ');
            readln(jumlahMK[i]);
        end;

        // Perulangan input setiap mata kuliah
        for j := 1 to jumlahMK[i] do
        begin
            writeln;
            writeln('MATA KULIAH KE-', j);

            // Input nama mata kuliah
            write('Nama Mata Kuliah: ');
            readln(matkul[i,j]);

            // Input jumlah SKS
            write('Jumlah SKS: ');
            readln(sks[i,j]);

            // Validasi SKS
            while (sks[i,j] < 1) or
                    (sks[i,j] > 6) do
            begin
                writeln('SKS harus antara 1-6!');
                write('Masukkan kembali: ');
                readln(sks[i,j]);
            end;

            // Input nilai huruf
            write('Nilai (A/B+/B/C+/C/D/E): ');
            readln(nilai[i,j]);

            // Menentukan bobot nilai
            while not (
                (nilai[i,j] = 'A') or (nilai[i,j] = 'a') or
                (nilai[i,j] = 'B+') or (nilai[i,j] = 'b+') or
                (nilai[i,j] = 'B') or (nilai[i,j] = 'b') or
                (nilai[i,j] = 'C+') or (nilai[i,j] = 'c+') or
                (nilai[i,j] = 'C') or (nilai[i,j] = 'c') or
                (nilai[i,j] = 'D') or (nilai[i,j] = 'd') or
                (nilai[i,j] = 'E') or (nilai[i,j] = 'e')
            ) do
            begin
                writeln('Nilai tidak valid!');
                write('Masukkan nilai kembali: ');
                readln(nilai[i,j]);
            end;

            if (nilai[i,j] = 'A') or
                (nilai[i,j] = 'a') then
                mutu[i,j] := 4
            else if (nilai[i,j] = 'B+') or
                    (nilai[i,j] = 'b+') then
                mutu[i,j] := 3.5
            else if (nilai[i,j] = 'B') or
                    (nilai[i,j] = 'b') then
                mutu[i,j] := 3
            else if (nilai[i,j] = 'C+') or
                    (nilai[i,j] = 'c+') then
                mutu[i,j] := 2.5
            else if (nilai[i,j] = 'C') or
                    (nilai[i,j] = 'c') then
                mutu[i,j] := 2
            else if (nilai[i,j] = 'D') or
                    (nilai[i,j] = 'd') then
                mutu[i,j] := 1
            else
                mutu[i,j] := 0;

            // Menghitung skor dari SKS dikali bobot nilai
            skor[i,j] := sks[i,j] * mutu[i,j];
        end;
    end;

    // Perulangan untuk menampilkan hasil setiap mahasiswa
    for i := 1 to jumlahMhs do
    begin
        clrscr;

        // Mengatur nilai awal total SKS dan total skor
        totalSKS := 0;
        totalSkor := 0;

        // Menampilkan identitas mahasiswa
        writeln('==============================================');
        writeln('           HASIL STUDI MAHASISWA');
        writeln('==============================================');
        writeln('Nama : ', nama[i]);
        writeln('NIM  : ', nim[i]);

        writeln;
        writeln('-------------------------------------------------------');
        writeln('| No | Mata Kuliah          | SKS | Nilai | Skor |');
        writeln('-------------------------------------------------------');

        // Perulangan menampilkan setiap mata kuliah
        for j := 1 to jumlahMK[i] do
        begin
            writeln('| ', j:2,
                    ' | ', matkul[i,j]:20,
                    ' | ', sks[i,j]:3,
                    ' | ', nilai[i,j]:5,
                    ' | ', skor[i,j]:4:1, ' |');

            // Menjumlahkan seluruh SKS
            totalSKS := totalSKS + sks[i,j];

            // Menjumlahkan seluruh skor
            totalSkor := totalSkor + skor[i,j];
        end;

        writeln('-------------------------------------------------------');

        // Menghitung IP mahasiswa
        if totalSKS > 0 then
            IP := totalSkor / totalSKS
        else
            IP := 0;

        // Menampilkan hasil akhir
        writeln('Total SKS  : ', totalSKS);
        writeln('Total Skor : ', totalSkor:0:1);
        writeln('IP         : ', IP:0:2);

        writeln('==============================================');

        // Jeda sebelum menampilkan mahasiswa berikutnya
        if i < jumlahMhs then
        begin
            writeln;
            writeln('Tekan sembarang tombol untuk melihat');
            writeln('data mahasiswa selanjutnya...');
            readkey;
        end;
    end;

    // Pesan ketika seluruh data selesai ditampilkan
    writeln;
    writeln('Semua data mahasiswa telah ditampilkan.');

    readkey;
end.