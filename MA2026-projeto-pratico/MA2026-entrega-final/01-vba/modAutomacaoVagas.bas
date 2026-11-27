Attribute VB_Name = "modAutomacaoVagas"
Option Explicit

' Projeto: Mercado de Trabalho em Tecnologia - FATEC-SP
' Atualiza consultas do Excel e gera um relatorio de auditoria da tabela de vagas.
' Pre-requisito: a base deve estar formatada como Tabela do Excel (Ctrl+T).

Public Sub AtualizarEAuditarVagas()
    Dim wb As Workbook, wsBase As Worksheet, wsRel As Worksheet
    Dim tbl As ListObject, col As ListColumn
    Dim linha As Long, totalRegistros As Long, totalColunas As Long
    Dim totalVazios As Double, vaziosColuna As Double
    On Error GoTo TrataErro

    Set wb = ThisWorkbook
    Application.ScreenUpdating = False
    Application.EnableEvents = False
    Application.StatusBar = "Atualizando consultas e conexoes..."

    wb.RefreshAll
    On Error Resume Next
    Application.CalculateUntilAsyncQueriesDone
    On Error GoTo TrataErro

    Set tbl = Nothing
    For Each wsBase In wb.Worksheets
        If wsBase.ListObjects.Count > 0 Then
            Set tbl = wsBase.ListObjects(1)
            Exit For
        End If
    Next wsBase

    If tbl Is Nothing Then Err.Raise vbObjectError + 1000, , _
        "Nenhuma Tabela do Excel foi encontrada. Transforme a base em Tabela (Ctrl+T) e tente novamente."

    totalRegistros = 0
    If Not tbl.DataBodyRange Is Nothing Then totalRegistros = tbl.DataBodyRange.Rows.Count
    totalColunas = tbl.ListColumns.Count

    Application.DisplayAlerts = False
    On Error Resume Next
    wb.Worksheets("Relatorio_VBA").Delete
    On Error GoTo TrataErro
    Application.DisplayAlerts = True

    Set wsRel = wb.Worksheets.Add(After:=wb.Worksheets(wb.Worksheets.Count))
    wsRel.Name = "Relatorio_VBA"

    With wsRel
        .Range("A1").Value = "RELATORIO DE ATUALIZACAO E AUDITORIA - VAGAS"
        .Range("A2").Value = "Projeto: Mercado de Trabalho em Tecnologia"
        .Range("A3").Value = "Data/hora da execucao:"
        .Range("B3").Value = Now
        .Range("A5").Value = "Tabela analisada:"
        .Range("B5").Value = tbl.Name
        .Range("A6").Value = "Total de registros:"
        .Range("B6").Value = totalRegistros
        .Range("A7").Value = "Total de colunas:"
        .Range("B7").Value = totalColunas
        .Range("A9").Value = "COLUNA"
        .Range("B9").Value = "CELULAS VAZIAS"
        .Range("C9").Value = "PERCENTUAL VAZIO"
        linha = 10
        totalVazios = 0
        For Each col In tbl.ListColumns
            vaziosColuna = 0
            If Not tbl.DataBodyRange Is Nothing Then
                vaziosColuna = Application.WorksheetFunction.CountBlank(col.DataBodyRange)
            End If
            .Cells(linha, 1).Value = col.Name
            .Cells(linha, 2).Value = vaziosColuna
            If totalRegistros > 0 Then
                .Cells(linha, 3).Value = vaziosColuna / totalRegistros
            Else
                .Cells(linha, 3).Value = 0
            End If
            totalVazios = totalVazios + vaziosColuna
            linha = linha + 1
        Next col
        .Range("A1:C1").Font.Bold = True
        .Range("A1:C1").Font.Size = 14
        .Range("A9:C9").Font.Bold = True
        .Range("B3").NumberFormat = "dd/mm/yyyy hh:mm"
        .Range("C10:C" & Application.Max(10, linha - 1)).NumberFormat = "0.0%"
        .Columns("A:C").AutoFit
        .Cells(linha + 1, 1).Value = "Total de celulas vazias (todas as colunas):"
        .Cells(linha + 1, 2).Value = totalVazios
        .Range(.Cells(linha + 1, 1), .Cells(linha + 1, 2)).Font.Bold = True
    End With

    wsRel.Activate
    Application.StatusBar = False
    Application.ScreenUpdating = True
    Application.EnableEvents = True
    MsgBox "Atualizacao concluida." & vbCrLf & _
           "Registros analisados: " & totalRegistros & vbCrLf & _
           "Colunas analisadas: " & totalColunas & vbCrLf & _
           "Relatorio criado na aba 'Relatorio_VBA'.", vbInformation, "Projeto MA2026"
    Exit Sub

TrataErro:
    Application.DisplayAlerts = True
    Application.StatusBar = False
    Application.ScreenUpdating = True
    Application.EnableEvents = True
    MsgBox "Nao foi possivel concluir a automacao:" & vbCrLf & Err.Description, vbExclamation, "Projeto MA2026"
End Sub
