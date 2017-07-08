import {Directive, Input, ElementRef, AfterViewInit} from '@angular/core';

@Directive({ selector: '[appTypewriter]' })
export class TypeWriterDirective implements AfterViewInit {
  private originalText;
  private _delay = 30;
  @Input() set delay(value: number) {
    this._delay = value || 100;
  }
  constructor (private el: ElementRef) {
  }

  ngAfterViewInit() {
    this.originalText = this.el.nativeElement.textContent;
    this.el.nativeElement.textContent = '';
    let textLength = 0;
    const interval = setInterval(() => {
      if (textLength >= this.originalText.length) {
        clearInterval(interval);
      } else {
        textLength++;
        this.el.nativeElement.textContent = this.originalText.substring(0, textLength);
      }
    }, this._delay);
  }
}

/*
 import {Directive, Input, ElementRef, AfterViewInit} from '@angular/core';


@Directive({selector: '[appTypewriter]'})
export class TypeWriterDirective implements AfterViewInit {
  private originalText;
  private _delay = 100;
  @Input() set delay(value: number) {
    this._delay = value || 100;
  }
  constructor (private el: ElementRef) {
  }

  ngAfterViewInit() {
    this.originalText = this.el.nativeElement.textContent;
    this.el.nativeElement.textContent = '';
    let textLength = 0;
    const interval = setInterval(() => {
      if (textLength >= this.originalText.length) {
        clearInterval(interval);
      } else {
        textLength++;
        this.el.nativeElement.textContent = this.originalText.substring(0, textLength);
      }
    }, this._delay);
  }
}
*/
