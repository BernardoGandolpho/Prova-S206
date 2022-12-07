/// <reference types="cypress"/>

describe('Testando Banco', () => {
  it('Teste Deposito', () => {
    cy.visit('https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login')

    cy.login('Harry Potter')
    
    cy.get('[ng-class="btnClass2"]').click()
    cy.get('.form-control').type(10000)
    cy.get('form.ng-dirty > .btn').click()

    cy.get('.error').should('contain.text', 'Deposit Successful')

    cy.get('.borderM > :nth-child(3) > :nth-child(2)').should('contain.text', '10000')
  })

  it('Teste Saque sem fundo', () => {
    cy.visit('https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login')

    cy.login('Harry Potter')
    
    cy.get('[ng-class="btnClass3"]').click()
    cy.get('.form-control').type(10000)
    cy.get('form.ng-dirty > .btn').click()

    cy.get('.error').should('contain.text', 'Transaction Failed. You can not withdraw amount more than the balance.')

    cy.get('.borderM > :nth-child(3) > :nth-child(2)').should('contain.text', '0')
  })

  it('Teste Deposito em Rupee', () => {
    cy.visit('https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login')

    cy.login('Harry Potter')

    cy.get('#accountSelect').select("1006")

    cy.get('[ng-class="btnClass2"]').click()
    cy.get('.form-control').type(10000)
    cy.get('form.ng-dirty > .btn').click()

    cy.get('.borderM > :nth-child(3) > :nth-child(2)').should('contain.text', '10000')
    cy.get('.borderM > :nth-child(3) > :nth-child(3)').should('contain.text', 'Rupee')
  })
})
