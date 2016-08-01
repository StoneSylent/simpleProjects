<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Webpages_1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    body {
        background-image: url(/Content/codeBackground.PNG);
        background-repeat: no-repeat;
        background-position-x: center;
    }

    #infobox {
        padding-bottom: 25px;
        border: 2px solid black;
        margin-top: 60px;
        margin-left: -175px;
        position: absolute;
        left: 50%;
        width: 350px;
        text-align: center;
        background-color: white;
    }

    .info {
        text-align: left;
        padding-left: 25px;
    }

    footer {
        padding-left: 50px;
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: initial;
        background-color: white;
    }
</style>

<div class="col-sm-12">
    <div id="infobox">
        <h2><%: Title %></h2>
        <div class="info">
            <strong>Mobile: </strong>614-282-4844<br />
            <strong>Email: </strong><a href="mailto:brandon.stone505@gmail.com">brandon.stone505@gmail.com</a><br />
            <strong>LinkedIn: </strong><a href="https://www.linkedin.com/in/stone505">linkedin.com/in/stone505</a><br />
            <strong>GitHub: </strong><a href="http://stonesylent.github.io/simpleProjects/">stonesylent.github.io/simpleProjects</a><br />
        </div>
    </div>
</div>
</asp:Content>
